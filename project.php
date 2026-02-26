<?php
require 'vendor/autoload.php';
require 'src/projects.php';

// Récupérer l'ID du paramètre GET
$id = isset($_GET['id']) ? (int)$_GET['id'] : 1;

// Chercher le projet avec cet ID
$selectedProject = null;
foreach ($projects as $project) {
    if ($project['id'] == $id) {
        $selectedProject = $project;
        break;
    }
}

// Si le projet n'existe pas, rediriger vers la page projets
if (!$selectedProject) {
    header('Location: projects.php');
    exit;
}

// Initialiser Twig
$loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/templates');
$twig = new \Twig\Environment($loader);

// Charger le template et passer la variable
$template = $twig->load('detail-project.twig');
echo $template->render(['project' => $selectedProject, 'projects' => $projects]);
