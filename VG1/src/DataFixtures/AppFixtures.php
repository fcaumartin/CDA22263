<?php

namespace App\DataFixtures;


use App\Entity\Client;
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



        $manager->flush();
    }
}
