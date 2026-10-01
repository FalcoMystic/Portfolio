<?php
// filepath: c:\xampp\htdocs\SAE203_NGUYEN_Luan_V2.2\valider_commande.php

// Inclure la configuration de la base de données
include('include/config.php');

// Simuler une validation de commande
session_start();

// Supprimer les articles du panier
if (isset($_SESSION['panier'])) {
    unset($_SESSION['panier']); // Vide le panier
}

// Ajouter un message de confirmation
$_SESSION['message'] = 'Votre commande a été validée avec succès ! Merci pour votre achat.';

// Rediriger vers la page de confirmation
header('Location: confirmation_commande.php');
exit;