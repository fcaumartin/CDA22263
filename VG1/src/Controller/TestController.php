<?php

namespace App\Controller;

use App\Repository\ProduitRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TestController extends AbstractController
{
    #[Route('/test', name: 'app_home')]
    public function app_home(ProduitRepository $repo): Response
    {
        $liste = $repo->findByPrix(1000);

        dd($liste);

        return $this->render('test/index.html.twig', [
            'controller_name' => 'TestController',
        ]);
    }

    #[Route('/page37', name: 'app_page1')]
    public function app_page1(): Response
    {
        return $this->render('test/page1.html.twig', [
            'controller_name' => 'TestController',
        ]);
    }

    #[Route('/page2', name: 'app_page2')]
    public function app_page2(): Response
    {
        return $this->render('test/page2.html.twig', [
            'nom' => 'Titi',
        ]);
    }
}
