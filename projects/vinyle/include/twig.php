<?php
// Pour les utilisateurs de MAMP (Mac) : force l'affichage des erreurs PHP
error_reporting(E_ALL);
ini_set("display_errors", 1);

require_once('vendor/autoload.php');

// Fonction qui permet d'initialiser Twig en fixant le dossier des modèles
function init_twig()
{
	// Indique le répertoire ou sont placés les modèles (templates)
	$loader = new \Twig\Loader\FilesystemLoader('templates');

	// Crée un nouveau moteur Twig
	$twig = new \Twig\Environment($loader, ['debug' => true]);
	$twig->addExtension(new \Twig\Extension\DebugExtension());

	// Renvoie le moteur
	return $twig;
}
