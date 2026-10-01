<?php

// Initialise Twig
include('include/twig.php');
include('include/language/data_en.php');
$twig = init_twig();


// Lancement du moteur Twig :
// $twig->render($modele-de-page, $tableau-de-variables)
//
// Le premier paramètre est le nom du modèle de page (le fichier Twig) à utiliser
//
// Le second paramètre est un tableau contenant les variables envoyées au modèle Twig
// Chaque ligne indique 'nom-variable-twig' => valeur-variable-twig
echo $twig->render('circuits.twig', [
    'titre_page' => 'Tracks',
    'description_page' => 'Tracks Presentation',
    'club' => $club,
    'circuit' => $circuit,
    'voiture' => $voitures,
    'lang' => 'en',
    'lang_fr' => 'circuits_fr.php',
]);
?>