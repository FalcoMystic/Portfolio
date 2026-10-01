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
echo $twig->render('clubs.twig', [
    'titre_page' => 'Clubs',
    'description_page' => 'Les clubs les plus réputés',
    'club' => $club,
    'circuit' => $circuit,
    'voiture' => $voitures,
    'lang' => 'fr',
    'lang_en' => 'clubs_en.php'
]);

?>