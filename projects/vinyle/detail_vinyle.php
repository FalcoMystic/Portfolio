<?php
// Initialise Twig
include('include/twig.php');
$twig = init_twig();

// Récupère les identifiants dans un fichier de configuration
include('include/config.php');

// Récupération de l'ID du vinyle
if (isset($_GET['id']))
    $id = $_GET['id'];
else
    $id = 0;
$id = intval($id);

// Connexion à la base de données et force l'affichage des erreurs SQL
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);

// Requête pour récupérer les détails du vinyle
$sql_vinyle = '
    SELECT       
        v.id_vinyle,
        v.titre
    FROM 
        vinyles v
    WHERE 
        v.id_vinyle = :id';
$query_vinyle = $pdo->prepare($sql_vinyle);
$query_vinyle->bindValue(':id', $id, PDO::PARAM_INT);
$query_vinyle->execute();
$vinyle = $query_vinyle->fetch(PDO::FETCH_ASSOC);

// Requête pour récupérer les commentaires associés au vinyle
$sql_commentaires = '
    SELECT 
        avis.nom AS auteur,
        avis.texte AS commentaire,
        avis.date AS date
    FROM 
        vinyle_avis va
    LEFT JOIN 
        avis ON va.id_commentaire = avis.id_commentaire
    WHERE 
        va.id_vinyle = :id
';
$query_commentaires = $pdo->prepare($sql_commentaires);
$query_commentaires->bindValue(':id', $id, PDO::PARAM_INT);
$query_commentaires->execute();
$commentaires = $query_commentaires->fetchAll(PDO::FETCH_ASSOC);

$sql_sons = '
    SELECT 
        s.id_son,
        s.titre,
        s.duree,
        s.nombre_ecoute
    FROM 
        sons s
    WHERE 
        s.id_vinyle = :id
';
$query_sons = $pdo->prepare($sql_sons);
$query_sons->bindValue(':id', $id, PDO::PARAM_INT);
$query_sons->execute();
$sons = $query_sons->fetchAll(PDO::FETCH_ASSOC);

// Lancement du moteur Twig avec les données
echo $twig->render('detail_vinyle.twig', [
    'vinyle' => $vinyle,
    'commentaires' => $commentaires,
    'sons' => $sons
]);