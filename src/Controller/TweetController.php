<?php

namespace App\Controller;

use App\Entity\Tweet;
use App\Entity\Comment;
use App\Entity\User;
use App\Form\CommentType;
use App\Form\TweetType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authorization\AuthorizationCheckerInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use App\Repository\TweetRepository;
use Knp\Component\Pager\PaginatorInterface;



class TweetController extends AbstractController
{
    /**
     * @Route("/tweet/{id}", name="app_tweet", requirements={"id"="\d+"})
     */
    public function index(Tweet $tweet, Request $request)
    {

        $entityManager = $this->getDoctrine()->getManager();
        $renderedForm = null;

        if($this->isGranted("IS_AUTHENTICATED_FULLY"))
        {
           $comment = new Comment();
           $form = $this->createForm(CommentType::class, $comment);
           $form->handleRequest($request);

           if($form->isSubmitted() && $form->isValid())
           {    
              
               $comment->setUser($this->getUser()); 
               $comment->setTweet($tweet);
               $entityManager = $this->getDoctrine()->getManager();
               $entityManager->persist($comment);
               $entityManager->flush();
               return $this->redirectToRoute("app_tweet", ['id' => $tweet->getId()]);
           }

           $renderedForm = $form->createView();
        }

        $tweet->setViews($tweet->getViews() + 1);

        $entityManager->persist($tweet);
        $entityManager->flush();

        return $this->render('tweet/index.html.twig', [
            'tweet' => $tweet,
            'commentForm' => $renderedForm,
         ]);
    }

    /**
     * @Route("/my_tweets", name="app_my_tweets", requirements={"id"="\d+"})
     */
    public function myTweets(Request $request, UserInterface $user, TweetRepository $tweetRepository, PaginatorInterface $paginator)
    {

        $userId = $user->getId();

        if($this->isGranted("IS_AUTHENTICATED_FULLY"))
        {
           $tweetsQuery = $tweetRepository->findBy(['user' => $userId], ['created' => 'DESC']);

           $tweets = $paginator->paginate(
            $tweetsQuery, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            5/*limit per page*/
        );
        

           return $this->render('main/index.html.twig', [
               'tweets' => $tweets,
           ]);      
        }      
        
        return $this->redirectToRoute("main");
    }


    /**
     * @Route("/tweets/{user.id}", name="app_user_tweets", requirements={"id"="\d+"})
     */
    public function userTweets(TweetRepository $tweetRepository, Request $request, PaginatorInterface $paginator)
    {
           $userId = $request->query->get('id');

           $tweets = $tweetRepository->findBy(['user' => $userId], ['created' => 'DESC']);

           $tweets = $paginator->paginate(
            $tweets, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            5/*limit per page*/
           );

           return $this->render('main/index.html.twig', [
               'tweets' => $tweets,
           ]);     
      
    }

    /**
     * @Route("/tweet/post", name="app_tweet_post")
     * @IsGranted("IS_AUTHENTICATED_FULLY")
     */
    public function postTweet(Request $request)
    {

        $tweet = new Tweet();
        $form = $this->createForm(TweetType::class, $tweet);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) { 
            $tweet->setUser($this->getUser());
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($tweet);
            $entityManager->flush();
            return $this->redirectToRoute("app_tweet", ['id' => $tweet->getId()]);
        }

        return $this->render('tweet/tweet.html.twig', [
            'tweetForm' => $form->createView(),
        ]);
    }

    /**
     * @Route("/tweet/delete/{id}/{userId}", name="delete_tweet" )
     */
    public function deleteTweet($id, $userId, AuthorizationCheckerInterface $authChecker, UserInterface $user)
    {       
        
        $user = $this->getUser()->getId();
 
        $entityManager = $this->getDoctrine()->getManager();
        $tweet = $entityManager->getRepository(Tweet::class)->find($id);

        if ($authChecker->isGranted('ROLE_ADMIN') || (int)$userId === (int)$user) {

            if (!$tweet) {
                throw $this->createNotFoundException(
                    'No tweet found for id '.$id
                );
            }

            $entityManager->remove($tweet);
            $entityManager->flush();
        }
        
        return $this->redirectToRoute("main");
    }

}
