<?php
session_start();
include('include/twig.php');
$twig = init_twig();
include('include/config.php');

$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

$vinyles = [];
if (!empty($_SESSION['panier'])) {
    $ids = implode(',', array_map('intval', $_SESSION['panier']));
    $sql = "SELECT * FROM vinyles WHERE id_vinyle IN ($ids)";
    $vinyles = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
}

echo $twig->render('panier.twig', [
    'vinyles' => $vinyles
]);