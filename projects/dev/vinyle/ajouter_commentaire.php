<?php
// Inclure la configuration de la base de données
include('include/config.php');

// Connexion à la base de données
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Vérification des données du formulaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_vinyle = intval($_POST['id_vinyle']);
    $nom = htmlspecialchars(strip_tags($_POST['nom']));
    $prenom = htmlspecialchars(strip_tags($_POST['prenom']));
    $commentaire = htmlspecialchars(strip_tags($_POST['commentaire']));
    $date = date('Y-m-d H:i:s'); // Date actuelle

    // Insérer le commentaire dans la table "avis"
    $sql = 'INSERT INTO avis (nom, texte, date) VALUES (:nom, :texte, :date)';
    $query = $pdo->prepare($sql);
    $query->execute([
        ':nom' => $nom . ' ' . $prenom,
        ':texte' => $commentaire,
        ':date' => $date
    ]);

    // Récupérer l'ID auto-incrémenté du commentaire
    $id_commentaire = $pdo->lastInsertId();

    // Associer le commentaire au vinyle dans la table "vinyle_avis"
    $sql_assoc = 'INSERT INTO vinyle_avis (id_vinyle, id_commentaire) VALUES (:id_vinyle, :id_commentaire)';
    $query_assoc = $pdo->prepare($sql_assoc);
    $query_assoc->execute([
        ':id_vinyle' => $id_vinyle,
        ':id_commentaire' => $id_commentaire
    ]);

    // Rediriger avec un message de confirmation
    session_start();
    $_SESSION['message'] = 'Votre commentaire a été ajouté avec succès.';
    header('Location: detail_vinyle.php?id=' . $id_vinyle);
    exit;
}