<?php

namespace App\Entity;

use App\Repository\MarkerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MarkerRepository::class)]
class Marker
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    private ?string $source = null;

    #[ORM\Column(length: 100)]
    private ?string $source_id_externe = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $species_name = null;

    #[ORM\Column]
    private ?float $latitude = null;

    #[ORM\Column]
    private ?float $longitude = null;

    #[ORM\Column(length: 500, nullable: true)]
    private ?string $photo_url = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $observed_on = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $last_synced_at = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $title = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $custom_description = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $place_guess = null;

    /**
     * @var Collection<int, Route>
     */
    #[ORM\ManyToMany(targetEntity: Route::class, inversedBy: 'markers')]
    private Collection $Route;

    public function __construct()
    {
        $this->Route = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSource(): ?string
    {
        return $this->source;
    }

    public function setSource(string $source): static
    {
        $this->source = $source;

        return $this;
    }

    public function getSourceIdExterne(): ?string
    {
        return $this->source_id_externe;
    }

    public function setSourceIdExterne(string $source_id_externe): static
    {
        $this->source_id_externe = $source_id_externe;

        return $this;
    }

    public function getSpeciesName(): ?string
    {
        return $this->species_name;
    }

    public function setSpeciesName(?string $species_name): static
    {
        $this->species_name = $species_name;

        return $this;
    }

    public function getLatitude(): ?float
    {
        return $this->latitude;
    }

    public function setLatitude(float $latitude): static
    {
        $this->latitude = $latitude;

        return $this;
    }

    public function getLongitude(): ?float
    {
        return $this->longitude;
    }

    public function setLongitude(float $longitude): static
    {
        $this->longitude = $longitude;

        return $this;
    }

    public function getPhotoUrl(): ?string
    {
        return $this->photo_url;
    }

    public function setPhotoUrl(?string $photo_url): static
    {
        $this->photo_url = $photo_url;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getObservedOn(): ?\DateTimeImmutable
    {
        return $this->observed_on;
    }

    public function setObservedOn(?\DateTimeImmutable $observed_on): static
    {
        $this->observed_on = $observed_on;

        return $this;
    }

    public function getLastSyncedAt(): ?\DateTimeImmutable
    {
        return $this->last_synced_at;
    }

    public function setLastSyncedAt(?\DateTimeImmutable $last_synced_at): static
    {
        $this->last_synced_at = $last_synced_at;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(?string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getCustomDescription(): ?string
    {
        return $this->custom_description;
    }

    public function setCustomDescription(?string $custom_description): static
    {
        $this->custom_description = $custom_description;

        return $this;
    }

    /**
     * @return Collection<int, Route>
     */
    public function getRoute(): Collection
    {
        return $this->Route;
    }

    public function addRoute(Route $route): static
    {
        if (!$this->Route->contains($route)) {
            $this->Route->add($route);
        }

        return $this;
    }

    public function removeRoute(Route $route): static
    {
        $this->Route->removeElement($route);

        return $this;
    }

    public function getPlaceGuess(): ?string
    {
        return $this->place_guess;
    }

    public function setPlaceGuess(?string $place_guess): static
    {
        $this->place_guess = $place_guess;
        return $this;
    }
}
