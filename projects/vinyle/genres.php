<?php
// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupération de la variable $id sur l'URL et conversion en entier
if (isset($_GET['id'])) $id = $_GET['id']; else $id = 0;
$id = intval($id);

// Récupère les identifiants dans un fichier de configuration
include('include/config.php');

// Connexion à la base de données et force l'affichage des erreurs SQL
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

// Récupération des données : l'auteur dont l'id est sur l'URL
$sql = 'select * from genres';
$query = $pdo->prepare($sql);
$query->execute();
$genres = $query->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('genres.twig', [
	'genres' => $genres
]);
