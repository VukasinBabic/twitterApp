<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TweetRepository")
 */
class Tweet
{
    public function __construct()
    {
        $this->comments = new ArrayCollection();

        $this->created = new \DateTime();
    }

    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $tweet;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="tweets")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user;

    /**
     * @ORM\Column(type="integer")
     */
    private $views = 0;

    /**
    * @ORM\Column(type="datetime", options={"default": "CURRENT_TIMESTAMP"})
    */
    private $created;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Comment", mappedBy="tweet", orphanRemoval=true, fetch="EXTRA_LAZY")
     */
    private $comments;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTweet(): ?string
    {
        return $this->tweet;
    }

    public function setTweet(string $tweet): self
    {
        $this->tweet = $tweet;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function getViews(): ?int
    {
        return $this->views;
    }

    public function setViews(int $views): self
    {
        $this->views = $views;

        return $this;
    }

    public function getCreated(): ?\DateTimeInterface
    {
        return $this->created;
    }

    public function setCreated(\DateTimeInterface $created): self
    {
        $this->created = $created;

        return $this;
    }

    /**
     * @return Collection|Comment[]
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): self
    {
        if (!$this->comment->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setComment($this);
        }

        return $this;
    }

    public function removeTweet(Comment $comment): self
    {
        if ($this->comments->contains($comment)) {
            $this->comments->removeElement($comment);
            // set the owning side to null (unless already changed)
            if ($comment->getTweet() === $this) {
                $comment->setTweet(null);
            }
        }

        return $this;
    }
}
