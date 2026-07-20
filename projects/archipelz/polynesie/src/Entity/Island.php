<?php

namespace App\Entity;

use App\Repository\IslandRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: IslandRepository::class)]
class Island
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\ManyToOne(inversedBy: 'islands')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Archipelago $archipelago = null;

    /**
     * @var Collection<int, Route>
     */
    #[ORM\ManyToMany(targetEntity: Route::class, mappedBy: 'islands')]
    private Collection $routes;

    public function __construct()
    {
        $this->routes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getArchipelago(): ?Archipelago
    {
        return $this->archipelago;
    }

    public function setArchipelago(?Archipelago $archipelago): static
    {
        $this->archipelago = $archipelago;

        return $this;
    }

    /**
     * @return Collection<int, Route>
     */
    public function getRoutes(): Collection
    {
        return $this->routes;
    }

    public function addRoute(Route $route): static
    {
        if (!$this->routes->contains($route)) {
            $this->routes->add($route);
            $route->addIsland($this);
        }

        return $this;
    }

    public function removeRoute(Route $route): static
    {
        if ($this->routes->removeElement($route)) {
            $route->removeIsland($this);
        }

        return $this;
    }
}
