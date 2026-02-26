<?php
// filepath: c:\xampp\htdocs\SAE203_NGUYEN_Luan_V6\modifier_vinyle.php
session_start();
require_once 'include/config.php';

// Connexion à la base
$pdo = new PDO('mysql:host=' . SERVER . ';dbname=' . BDD . ';charset=utf8', USER, PASSWORD);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Récupération de l'ID du vinyle
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Traitement du formulaire
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $titre = $_POST['titre'];
    $prix = $_POST['prix'];
    $id_genre = $_POST['id_genre'];
    $id_artiste = $_POST['id_artiste'];

    $sql = "UPDATE vinyles SET titre = :titre, prix = :prix, id_genre = :id_genre, id_artiste = :id_artiste WHERE id_vinyle = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':titre' => $titre,
        ':prix' => $prix,
        ':id_genre' => $id_genre,
        ':id_artiste' => $id_artiste,
        ':id' => $id
    ]);
    $_SESSION['message'] = "Vinyle modifié avec succès.";
    header("Location: detail_vinyle.php?id=$id");
    exit;
}

// Récupération des infos du vinyle
$stmt = $pdo->prepare("SELECT * FROM vinyles WHERE id_vinyle = :id");
$stmt->execute([':id' => $id]);
$vinyle = $stmt->fetch();

if (!$vinyle) {
    echo "Vinyle introuvable.";
    exit;
}

// Récupération des genres et artistes pour les listes déroulantes
$genres = $pdo->query("SELECT * FROM genres")->fetchAll();
$artistes = $pdo->query("SELECT * FROM artistes")->fetchAll();
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Modifier un vinyle</title>
    <link rel="stylesheet" href="css/base.css">
</head>

<body>
    <main class="main-modifier-vinyle">
        <h1>Modifier le vinyle</h1>
        <form method="post" class="form-commentaire">
            <div>
                <label for="titre">Titre :</label>
                <input type="text" name="titre" id="titre" value="<?= htmlspecialchars($vinyle['titre']) ?>" required>
            </div>
            <div>
                <label for="prix">Prix (€) :</label>
                <input type="number" step="0.01" name="prix" id="prix" value="<?= htmlspecialchars($vinyle['prix']) ?>"
                    required>
            </div>
            <div>
                <label for="id_genre">Genre :</label>
                <select name="id_genre" id="id_genre" required>
                    <?php foreach ($genres as $genre): ?>
                        <option value="<?= $genre['id_genre'] ?>" <?= $vinyle['id_genre'] == $genre['id_genre'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($genre['nom']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <label for="id_artiste">Artiste :</label>
                <select name="id_artiste" id="id_artiste" required>
                    <?php foreach ($artistes as $artiste): ?>
                        <option value="<?= $artiste['id_artiste'] ?>" <?= $vinyle['id_artiste'] == $artiste['id_artiste'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($artiste['nom']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <button type="submit">Enregistrer les modifications</button>
        </form>
        <p><a href="detail_vinyle.php?id=<?= $id ?>">Retour au détail du vinyle</a></p>
    </main>
</body>

</html>