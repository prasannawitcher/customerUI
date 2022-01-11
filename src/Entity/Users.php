<?php

namespace App\Entity;

use App\Repository\UsersRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=UsersRepository::class)
 */
class Users
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $AuthUsername;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $authHash;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getAuthUsername(): ?string
    {
        return $this->AuthUsername;
    }

    public function setAuthUsername(string $AuthUsername): self
    {
        $this->AuthUsername = $AuthUsername;

        return $this;
    }

    public function getAuthHash(): ?string
    {
        return $this->authHash;
    }

    public function setAuthHash(string $authHash): self
    {
        $this->authHash = $authHash;

        return $this;
    }
}
