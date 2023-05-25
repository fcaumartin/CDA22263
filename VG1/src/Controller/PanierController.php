<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Repository\ProduitRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PanierController extends AbstractController
{
    #[Route('/panier', name: 'app_panier')]
    public function index(Request $request, ProduitRepository $repo): Response
    {
        $session = $request->getSession();
        $panier = $session->get("panier", []);

        $liste = [];
        foreach($panier as $id => $quantite) {
            $produit = $repo->find($id);
            $produit->quantite = $quantite;
            $liste[] = $produit;
        }
        

        return $this->render('panier/index.html.twig', [
            'panier' => $liste
        ]);
    }

    #[Route('/add/{id}', name: 'app_panier_add')]
    public function add(Request $request, $id): Response
    {
        $session = $request->getSession();

        $panier = $session->get("panier", []);

        if (isset($panier[$id])) {
            $panier[$id]++;
        }
        else {
            $panier[$id]=1;
        }

        $session->set("panier", $panier);

        return $this->redirect("/panier");
    }
}
