<?php
// Inclure la configuration et initialiser Twig
include('include/config.php');
include('include/twig.php');
$twig = init_twig();

// Connexion à la base de données
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Récupérer les filtres depuis l'URL
$genres = isset($_GET['genres']) ? $_GET['genres'] : [];
$artistes = isset($_GET['artistes']) ? $_GET['artistes'] : [];
$prix = isset($_GET['prix']) ? $_GET['prix'] : [];

// Construire la requête SQL avec les filtres
$sql = 'SELECT * FROM vinyles WHERE 1=1';
$params = [];

// Filtrer par genres
if (!empty($genres)) {
    $sql .= ' AND id_genre IN (' . implode(',', array_fill(0, count($genres), '?')) . ')';
    $params = array_merge($params, $genres);
}

// Filtrer par artistes
if (!empty($artistes)) {
    $sql .= ' AND id_artiste IN (' . implode(',', array_fill(0, count($artistes), '?')) . ')';
    $params = array_merge($params, $artistes);
}

// Filtrer par plages de prix
if (!empty($prix)) {
    $prix_conditions = [];
    foreach ($prix as $range) {
        list($min, $max) = explode('-', $range);
        $prix_conditions[] = '(prix >= ? AND prix <= ?)';
        $params[] = $min;
        $params[] = $max;
    }
    $sql .= ' AND (' . implode(' OR ', $prix_conditions) . ')';
}

// Préparer et exécuter la requête
$query = $pdo->prepare($sql);
$query->execute($params);
$vinyles = $query->fetchAll(PDO::FETCH_ASSOC);

// Récupérer les genres et artistes pour les filtres
$genres_query = $pdo->query('SELECT * FROM genres');
$genres = $genres_query->fetchAll(PDO::FETCH_ASSOC);

$artistes_query = $pdo->query('SELECT * FROM artistes');
$artistes = $artistes_query->fetchAll(PDO::FETCH_ASSOC);

// Rendre la page avec Twig
echo $twig->render('vinyles.twig', [
    'vinyles' => $vinyles,
    'genres' => $genres,
    'artistes' => $artistes,
    'selected_genres' => isset($_GET['genres']) ? $_GET['genres'] : [],
    'selected_artistes' => isset($_GET['artistes']) ? $_GET['artistes'] : [],
    'selected_prix' => isset($_GET['prix']) ? $_GET['prix'] : []
]);