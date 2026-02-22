<?php
require 'vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/templates');
$twig = new \Twig\Environment($loader);

$template = $twig->load('index.twig');  // Twig interprète ici
echo $template->render();