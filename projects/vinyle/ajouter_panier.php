<?php
session_start();

if (isset($_POST['id_vinyle'])) {
    $id = intval($_POST['id_vinyle']);
    if (!isset($_SESSION['panier'])) {
        $_SESSION['panier'] = [];
    }
    if (!in_array($id, $_SESSION['panier'])) {
        $_SESSION['panier'][] = $id;
    }
    // Ajout d'un message de confirmation en session
    $_SESSION['message'] = "Vinyle ajouté au panier !";
    // Redirection vers la fiche vinyle
    header('Location: detail_vinyle.php?id=' . $id);
    exit;
}
header('Location: index.php');
exit;