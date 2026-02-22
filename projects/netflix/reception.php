<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>Réception de données de formulaires</title <link rel="stylesheet" media="screen" href="style_tintin_03.css">

	<style>
		.niv1 {
			color: blue;
			font-size: 24pt;
			font-weight: bold;
		}

		.niv2 {
			color: black;
			font-size: 12pt;
			font-weight: bold;
		}

		.niv3 {
			color: green;
			font-size: 12pt;
			font-weight: bold;
		}
	</style>
</head>

<body>

	<?php

	print ("<div class='niv1'>Variables reçues par la méthode POST</div>");
	foreach ($_POST as $key => $value) {
		print ("<div class='niv2'>$key</div>");
		print ("<div class='niv3'>$value</div>");
	}

	?>
	</div>

	<div class="niv1">Variables reçues par la méthode GET</div>
	<?php
	foreach ($_GET as $key => $value) {
		print ("<div class='niv2'>$key</div>");
		print ("<div class='niv3'>$value</div>");
	}
	?>

</body>

</html>