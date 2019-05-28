<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Repository\TweetRepository;
use App\Repository\UserRepository;
use Knp\Component\Pager\PaginatorInterface;


class MainController extends AbstractController
{
    /**
     * @Route("/", name="main")
     */
    public function index(Request $request, TweetRepository $tweetRepository, PaginatorInterface $paginator)    {

        //$entityManager = $this->getDoctrine()->getManager();

        $tweetsQuery = $tweetRepository->findBy([], ['created' => 'DESC']);
        
        $tweets = $paginator->paginate(
            $tweetsQuery, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/, 
            5/*limit per page*/
        );
        
        return $this->render('main/index.html.twig', [
            'tweets' => $tweets,
        ]);
    }
}
  