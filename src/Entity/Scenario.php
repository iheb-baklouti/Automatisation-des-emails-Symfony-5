<?php

namespace App\Entity;

use App\Repository\ScenarioRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ScenarioRepository::class)
 */
class Scenario
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date")
     */
    private $dateenvoi;

    /**
     * @ORM\ManyToMany(targetEntity=Client::class, inversedBy="scenarios")
     */
    private $idClient;

    /**
     * @ORM\ManyToMany(targetEntity=Mail::class, inversedBy="scenarios")
     */
    private $idMail;

    /**
     * @ORM\ManyToMany(targetEntity=Critere::class, mappedBy="scenario")
     */
    private $criteres;

    public function __construct()
    {
        $this->Client = new ArrayCollection();
        $this->mail = new ArrayCollection();
        $this->idClient = new ArrayCollection();
        $this->idMail = new ArrayCollection();
        $this->criteres = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

   

    public function getDateenvoi(): ?\DateTimeInterface
    {
        return $this->dateenvoi;
    }

    public function setDateenvoi(\DateTimeInterface $dateenvoi): self
    {
        $this->dateenvoi = $dateenvoi;

        return $this;
    }

    /**
     * @return Collection|Client[]
     */
    public function getIdClient(): Collection
    {
        return $this->idClient;
    }

    public function addIdClient(Client $idClient): self
    {
        if (!$this->idClient->contains($idClient)) {
            $this->idClient[] = $idClient;
        }

        return $this;
    }

    public function removeIdClient(Client $idClient): self
    {
        $this->idClient->removeElement($idClient);

        return $this;
    }

    /**
     * @return Collection|Mail[]
     */
    public function getIdMail(): Collection
    {
        return $this->idMail;
    }

    public function addIdMail(Mail $idMail): self
    {
        if (!$this->idMail->contains($idMail)) {
            $this->idMail[] = $idMail;
        }

        return $this;
    }

    public function removeIdMail(Mail $idMail): self
    {
        $this->idMail->removeElement($idMail);

        return $this;
    }

    /**
     * @return Collection|Critere[]
     */
    public function getCriteres(): Collection
    {
        return $this->criteres;
    }

    public function addCritere(Critere $critere): self
    {
        if (!$this->criteres->contains($critere)) {
            $this->criteres[] = $critere;
            $critere->addScenario($this);
        }

        return $this;
    }

    public function removeCritere(Critere $critere): self
    {
        if ($this->criteres->removeElement($critere)) {
            $critere->removeScenario($this);
        }

        return $this;
    }
}
