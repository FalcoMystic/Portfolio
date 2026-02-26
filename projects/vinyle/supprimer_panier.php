<?php
session_start();
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    if (isset($_SESSION['panier'])) {
        $_SESSION['panier'] = array_diff($_SESSION['panier'], [$id]);
    }
}
header('Location: panier.php');
exit;