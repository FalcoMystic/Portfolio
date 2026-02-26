<?php
// filepath: c:\xampp\htdocs\SAE203_NGUYEN_Luan_V2.2\confirmation_commande.php

// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupérer le message de confirmation
session_start();
$message = isset($_SESSION['message']) ? $_SESSION['message'] : '';

// Afficher la page de confirmation
echo $twig->render('confirmation_commande.twig', [
    'message' => $message
]);

// Supprimer le message de confirmation après affichage
unset($_SESSION['message']);