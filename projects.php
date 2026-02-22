<?php

require 'vendor/autoload.php';
// Récupérer le tableau de projets
require 'src/projects.php';

// Initialiser Twig
$loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/templates');
$twig = new \Twig\Environment($loader);

// Charger le template et passer la variable
$template = $twig->load('projects.twig');
echo $template->render(['projets' => $projects]);
