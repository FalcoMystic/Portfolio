<?php

namespace App\Service;

use App\Entity\Marker;
use App\Repository\MarkerRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Contracts\HttpClient\HttpClientInterface;

class InaturalistService
{
    private const SOURCE = 'iNaturalist';
    private const API_URL = 'https://api.inaturalist.org/v1/observations';
    private const BOUNDING_BOX = [
        'nelat' => -7,
        'nelng' => -134,
        'swlat' => -28,
        'swlng' => -155,
    ];

    public function __construct(
        private HttpClientInterface $httpClient,
        private EntityManagerInterface $em,
        private MarkerRepository $markerRepository,
    ) {}

public function fetchAndStore(): array
    {
        $page = 1;
        $perPage = 100; // Réduit de 200 à 100
        $totalImported = 0;
        $totalUpdated = 0;
        $batchSize = 50; // Flush + clear tous les 50 marqueurs
        $count = 0;

        do {
            $response = $this->httpClient->request('GET', self::API_URL, [
                'query' => [
                    ...self::BOUNDING_BOX,
                    'quality_grade' => 'research',
                    'photos'        => 'true',
                    'geo'           => 'true',
                    'per_page'      => $perPage,
                    'page'          => $page,
                    'fields'        => 'id,species_guess,description,observed_on,geojson,photos,place_guess',
                ],
            ]);

            $data = $response->toArray();
            $results = $data['results'] ?? [];

            foreach ($results as $obs) {
                if (empty($obs['geojson'])) continue;

                $sourceIdExterne = (string) $obs['id'];

                $marker = $this->markerRepository->findOneBy([
                    'source'            => self::SOURCE,
                    'source_id_externe' => $sourceIdExterne,
                ]);

                if (!$marker) {
                    $marker = new Marker();
                    $marker->setSource(self::SOURCE);
                    $marker->setSourceIdExterne($sourceIdExterne);
                    $totalImported++;
                } else {
                    $totalUpdated++;
                }

                $photoUrl = $obs['photos'][0]['url'] ?? null;
                if ($photoUrl) {
                    $photoUrl = str_replace('square', 'medium', $photoUrl);
                }

                $marker->setSpeciesName($obs['species_guess'] ?? null);
                $marker->setLatitude($obs['geojson']['coordinates'][1]);
                $marker->setLongitude($obs['geojson']['coordinates'][0]);
                $marker->setPhotoUrl($photoUrl);
                $marker->setDescription($obs['description'] ?? null);
                $marker->setObservedOn(
                    isset($obs['observed_on'])
                        ? new \DateTimeImmutable($obs['observed_on'])
                        : null
                );
                $marker->setLastSyncedAt(new \DateTimeImmutable());
                $marker->setPlaceGuess($obs['place_guess'] ?? null);

                $this->em->persist($marker);
                $count++;

                // Flush + clear tous les $batchSize marqueurs
                if ($count % $batchSize === 0) {
                    $this->em->flush();
                    $this->em->clear();
                }
            }

            $this->em->flush();
            $this->em->clear();

            $page++;

        } while (count($results) === $perPage);

        return [
            'imported' => $totalImported,
            'updated'  => $totalUpdated,
        ];
    }
}