<?php
// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupère les identifiants dans un fichier de configuration
include('include/config.php');

// 
if (isset($_GET['id']))
	$id = $_GET['id'];
else
	$id = 0;
$id = intval($id);

// Connexion à la base de données et force l'affichage des erreurs SQL
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

// Récupération des données : listes des catégories
$sql = 'SELECT * FROM genres WHERE id_genre=:id';
$query = $pdo->prepare($sql);
$query->bindValue(':id', $id, PDO::PARAM_INT);
$query->execute();
$genres = $query->fetchAll(PDO::FETCH_ASSOC);

// Récupération des vinyles du genre
$sql_vinyles = 'SELECT * FROM vinyles WHERE id_genre = :id';
$query_vinyles = $pdo->prepare($sql_vinyles);
$query_vinyles->bindValue(':id', $id, PDO::PARAM_INT);
$query_vinyles->execute();
$vinyles = $query_vinyles->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('detail_genre.twig', [
	'genres' => $genres,
	'vinyles' => $vinyles
]);