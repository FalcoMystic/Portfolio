<?php

namespace App\Entity;

use App\Repository\ArchipelagoRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ArchipelagoRepository::class)]
class Archipelago
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    /**
     * @var Collection<int, Island>
     */
    #[ORM\OneToMany(targetEntity: Island::class, mappedBy: 'archipelago')]
    private Collection $islands;

    public function __construct()
    {
        $this->islands = new ArrayCollection();
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

    /**
     * @return Collection<int, Island>
     */
    public function getIslands(): Collection
    {
        return $this->islands;
    }

    public function addIsland(Island $island): static
    {
        if (!$this->islands->contains($island)) {
            $this->islands->add($island);
            $island->setArchipelago($this);
        }

        return $this;
    }

    public function removeIsland(Island $island): static
    {
        if ($this->islands->removeElement($island)) {
            // set the owning side to null (unless already changed)
            if ($island->getArchipelago() === $this) {
                $island->setArchipelago(null);
            }
        }

        return $this;
    }
}
