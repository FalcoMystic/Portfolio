<?php

// Initialise Twig
include('include/twig.php');
include('include/language/data_fr.php');
$twig = init_twig();

// Lancement du moteur Twig :
// $twig->render($modele-de-page, $tableau-de-variables)
//
// Le premier paramètre est le nom du modèle de page (le fichier Twig) à utiliser
//
// Le second paramètre est un tableau contenant les variables envoyées au modèle Twig
// Chaque ligne indique 'nom-variable-twig' => valeur-variable-twig
echo $twig->render('base.twig', [
    'titre_page' => 'Accueil',
    'lang' => 'fr',
    'lang_en' => 'index_en.php',
    'club' => $club,
    'circuit' => $circuit,
    'voiture' => $voitures,
]);
?>