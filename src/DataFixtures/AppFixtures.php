<?php

namespace App\DataFixtures;

use App\Entity\Client;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker;
use App\Entity\Mail;
class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {

        $faker = Faker\Factory::create('fr_FR');
           // on crée 4 auteurs avec noms et prénoms "aléatoires" en français
           for ($i = 0; $i < 4; $i++) {  
            $client = new Client();
            $client->setNom($faker->firstName(10));
            $client->setPrenom($faker->lastName(10));
            $client->setAdresse($faker->realText(100));
            $date=new \DateTime();
            //$date->$faker->dateTimeThisDecade($max = '+10 years');
            $dt = $faker->dateTimeBetween($startDate = '-30 years', $endDate = 'now');
            $date = $dt->format("Y-m-d"); // 1994-09-24
            $client->setDatedenaissance($dt);
            $client->setEmail($faker->email);
           // $client->setPropietaire($faker->boolean(50));
            //$client->setlocataire($faker->boolean(50));
           // $client->setmarie($faker->boolean(50));
            //$client->setcelibataire($faker->boolean(50));
           // $client->setenfant($faker->boolean(50));
            $manager->persist($client);
        }

           $mails = Array();
           for ($i = 0; $i < 4; $i++) {
               $mails = new Mail();
               $mails->setObjet($faker->realText(100));
               $mails->setDescription($faker->realText(700));

               $manager->persist($mails);
           }
        // $product = new Product();
        // $manager->persist($product);

        $manager->flush();
    }
}
