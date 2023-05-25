<?php

namespace App\DataFixtures;

use App\Entity\Client;
use App\Entity\Produit;
use App\Entity\Categorie;
use App\Entity\SousCategorie;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Bundle\FixturesBundle\Fixture;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $client1 = new Client();
        $client1->setNom("Toto");
        $client1->setPrenom("Toto");
        $manager->persist($client1);

        $client2 = new Client();
        $client2->setNom("Titi");
        $client2->setPrenom("Titi");
        $client2->setVille("Amiens");
        $manager->persist($client2);

        $c1 = new Categorie();
        $c1->setNom("Categorie1");
        $c1->setImage("image1");
        $manager->persist($c1);

        $c2 = new Categorie();
        $c2->setNom("Categorie2");
        $c2->setImage("image2");
        $manager->persist($c2);

        $sc1 = new SousCategorie();
        $sc1->setNom("SousCategorie1");
        $sc1->setImage("image1");
        $manager->persist($sc1);

        $sc2 = new SousCategorie();
        $sc2->setNom("SousCategorie2");
        $sc2->setImage("image2");
        $manager->persist($sc2);

        $p1 = new Produit();
        $p1->setNom("Produit1");
        $p1->setPrix(12345.67);
        $manager->persist($p1);

        $p2 = new Produit();
        $p2->setNom("Produit2");
        $p2->setPrix(999.67);
        $manager->persist($p2);

        $p3 = new Produit();
        $p3->setNom("Produit3");
        $p3->setPrix(123);
        $manager->persist($p3);

        $c1->addSousCategory($sc1);
        $c1->addSousCategory($sc2);
        $sc1->addProduit($p1);
        $sc1->addProduit($p2);
        $sc1->addProduit($p3);
        // $p1->setCategorie($c1);
        // $p2->setCategorie($c1);
        // $p3->setCategorie($c1);

        $manager->flush();
    }
}
