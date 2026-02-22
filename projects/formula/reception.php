<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>Réception des données du formulaire</title <link rel="stylesheet" media="screen" href="./css/reception.css">

<body>

	<?php
	print ("<div class='niv1'>Données entrées par l'utilisateur</div>");
	foreach ($_POST as $key => $value) {
		print ("<div class='niv2'>$key</div>");
		print ("<div class='niv3'>$value</div>");
	}
	?>

</body>

</html>