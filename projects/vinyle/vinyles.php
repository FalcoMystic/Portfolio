<?php
// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupère les identifiants dans un fichier de configuration
include('include/config.php');

// Connexion à la base de données et force l'affichage des erreurs SQL
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

// Récupération des données : listes des vinyles avec artistes et genres
$sql = '
    SELECT v.*, a.nom AS artiste_nom, g.nom AS genre_nom
    FROM vinyles v
    LEFT JOIN artistes a ON v.id_artiste = a.id_artiste
    LEFT JOIN genres g ON v.id_genre = g.id_genre
';
$query = $pdo->prepare($sql);
$query->execute();
$vinyles = $query->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('vinyles.twig', [
	'vinyles' => $vinyles
]);