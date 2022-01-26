<?php

namespace App\Entity;

use App\Repository\CritereRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CritereRepository::class)
 */
class Critere
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $propietaire;

    

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $marie;

   

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $enfant;

    /**
     * @ORM\ManyToMany(targetEntity=scenario::class, inversedBy="criteres")
     */
    private $scenario;

    /**
     * @ORM\ManyToMany(targetEntity=client::class, inversedBy="criteres")
     */
    private $client;

    public function __toString()
    {
        return $this->marie;
    }
    public function __construct()
    {
        $this->scenario = new ArrayCollection();
        $this->client = new ArrayCollection();
    }

    

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPropietaire(): ?bool
    {
        return $this->propietaire;
    }

    public function setPropietaire(bool $propietaire): self
    {
        $this->propietaire = $propietaire;

        return $this;
    }

   
    public function getMarie(): ?bool
    {
        return $this->marie;
    }

    public function setMarie(bool $marie): self
    {
        $this->marie = $marie;

        return $this;
    }

    

    public function getEnfant(): ?bool
    {
        return $this->enfant;
    }

    public function setEnfant(?bool $enfant): self
    {
        $this->enfant = $enfant;

        return $this;
    }

    /**
     * @return Collection|scenario[]
     */
    public function getScenario(): Collection
    {
        return $this->scenario;
    }

    public function addScenario(scenario $scenario): self
    {
        if (!$this->scenario->contains($scenario)) {
            $this->scenario[] = $scenario;
        }

        return $this;
    }

    public function removeScenario(scenario $scenario): self
    {
        $this->scenario->removeElement($scenario);

        return $this;
    }

    /**
     * @return Collection|client[]
     */
    public function getClient(): Collection
    {
        return $this->client;
    }

    public function addClient(client $client): self
    {
        if (!$this->client->contains($client)) {
            $this->client[] = $client;
        }

        return $this;
    }

    public function removeClient(client $client): self
    {
        $this->client->removeElement($client);

        return $this;
    }

   
}
