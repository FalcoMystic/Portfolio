<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\RouteRepository;
use App\Repository\ArchipelagoRepository;
use App\Repository\TagRepository;
use Symfony\Component\HttpFoundation\Request;

class StaticPages extends AbstractController
{
	#[Route('/', name: 'home')]
	public function index(): Response
	{
		return $this->render('home.html.twig', [
			'titre' => 'Découvrez la biodiversité de la Polynésie française'
		]);
	}

	#[Route('/parcours', name: 'parcours')]
	public function parcours(
		RouteRepository $routeRepository,
		ArchipelagoRepository $archipelagoRepository,
		TagRepository $tagRepository,
		Request $request
	): Response {
		$selectedArchipelagoIds = $request->query->all('archipelagos');
		$selectedTagIds = $request->query->all('tags');
		$durationMinH = $request->query->get('duration_min_h');
		$durationMinM = $request->query->get('duration_min_m');
		$durationMaxH = $request->query->get('duration_max_h');
		$durationMaxM = $request->query->get('duration_max_m');

		$durationMin = ($durationMinH !== null && $durationMinH !== '')
			? sprintf('%02d:%02d:00', $durationMinH, $durationMinM ?? 0)
			: null;
		$durationMax = ($durationMaxH !== null && $durationMaxH !== '')
			? sprintf('%02d:%02d:00', $durationMaxH, $durationMaxM ?? 0)
			: null;

		$routes = $routeRepository->findWithFilters($selectedArchipelagoIds, $durationMin, $durationMax, $selectedTagIds);

		$archipelagos = $archipelagoRepository->findAll();
		$tags = $tagRepository->findAll();

		$archipelagosByRoute = [];
		foreach ($routes as $route) {
			$archipelagosForRoute = [];
			foreach ($route->getIslands() as $island) {
				$archipelago = $island->getArchipelago();
				if ($archipelago && !in_array($archipelago, $archipelagosForRoute, true)) {
					$archipelagosForRoute[] = $archipelago;
				}
			}
			$archipelagosByRoute[$route->getId()] = $archipelagosForRoute;
		}

		return $this->render('parcours.html.twig', [
			'routes' => $routes,
			'archipelagosByRoute' => $archipelagosByRoute,
			'archipelagos' => $archipelagos,
			'tags' => $tags,
			'selectedArchipelagoIds' => array_map('strval', $selectedArchipelagoIds),
			'selectedTagIds' => array_map('strval', $selectedTagIds),
			'durationMinH' => $durationMinH,
			'durationMinM' => $durationMinM,
			'durationMaxH' => $durationMaxH,
			'durationMaxM' => $durationMaxM,
		]);
	}

	#[Route('/parcours/{id}', name: 'routeOne', methods: ['GET'], requirements: ['id' => '\d+'])]
    public function routeOne(RouteRepository $repository, int $id): Response
    {
        $route = $repository->find($id);

		$islands = $route->getIslands();

		// Récupérer les archipels uniques
		$archipelagos = [];
		foreach ($islands as $island) {
			$archipelago = $island->getArchipelago();
			if ($archipelago && !in_array($archipelago, $archipelagos, true)) {
				$archipelagos[] = $archipelago;
			}
		}

		$markers = $route->getMarkers();

        return $this->render('parcours_details.html.twig', [
            'route' => $route,
			'islands' => $islands,
			'archipelagos' => $archipelagos,
			'tags' => $route->getTags(),
			'reviews' => $route->getReviews(),
			'markers' => $markers
        ]);
    }

	#[Route('mentions', name: 'mentions')]
	public function mentions(): Response
	{
		return $this->render('mentions.html.twig', [
			'titre' => 'Mentions Légales'
		]);
	}

	#[Route('conditions', name: 'conditions')]
	public function conditions(): Response
	{
		return $this->render('conditions.html.twig', [
			'titre' => 'Conditions d\'utilisation'
		]);
	}
}