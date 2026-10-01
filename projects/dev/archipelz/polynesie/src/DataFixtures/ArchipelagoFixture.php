<?php

namespace App\DataFixtures;

use App\Entity\Archipelago;
use App\Entity\Island;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class ArchipelagoFixture extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $archipelagos = [
            "Société" => ["Tahiti", "Maiao", "Mehetia", "Moorea", "Tetiaroa", "Bora Bora", "Huahine", "Manuae", "Maupihaa", "Maupiti", "Motu One", "Raiatea", "Tahaa", "Tupai"],
            "Tuamotu" => ["Matureivavao", "Tenararo", "Tenarunga", "Vahanga", "Marokau", "Ravahere", "Napuka", "Puka Puka", "Tepoto Nord", "Anuanuraro", "Anuanurunga", "Hereheretue", "Nukutepipi", "Apataki", "Aratika", "Arutua", "Fakarava", "Kaukura", "Mataiva", "Rangiroa", "Makatea", "Tikehau", "Toau", "Hiti", "Tepoto Sud", "Tuanake", "Ahe", "Manihi", "Takapoto", "Takaroa", "Tikei"],
            "Marquises" => ["Nuku Hiva", "Hiva Oa", "Eiao", "Hatutu", "Motu One", "Ua Huka", "Ua Pou", "Fatu Hiva", "Fatu Huku", "Moho Tani", "Motu Nao", "Thuata"],
            "Australes" => ["Rurutu", "Tubuai", "Rimatara", "Rapa", "Raivavae", "Îles Maria", "Marotiri"],
            "Gambier" => ["Mangareva", "Akamaru", "Kouaku", "Makaroa", "Manui","Mekiro", "Totegegie", "Taravai", "Tekava", "Tepapuri"]
        ];

        foreach ($archipelagos as $archipelagoName => $islands) {
            $archipelago = new Archipelago();
            $archipelago->setName($archipelagoName);
            $manager->persist($archipelago);

            foreach ($islands as $islandName) {
                $island = new Island();
                $island->setName($islandName);
                $island->setArchipelago($archipelago); // attention à la relation owning side
                $manager->persist($island);

                // on peut ajouter la référence inverse si besoin
                $archipelago->addIsland($island);
            }
        }

        $manager->flush();
    }
}