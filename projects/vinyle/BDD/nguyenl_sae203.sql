-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 11 mai 2025 à 12:39
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nguyenl_sae203`
--

-- --------------------------------------------------------

--
-- Structure de la table `artistes`
--

CREATE TABLE `artistes` (
  `id_artiste` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `biographie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `artistes`
--

INSERT INTO `artistes` (`id_artiste`, `nom`, `biographie`) VALUES
(1, 'The Weeknd', 'Abel Makkonen Tesfaye, né le 16 février 1990 à Toronto, se fait remarquer en 2010 en publiant anonymement ses premières chansons sur YouTube. Son premier projet, House of Balloons (2011), impose son style sombre et éthéré, fusion d’alternative R&B, de trip hop et d’indie pop. Avec Trilogy (2012), il consolide son statut de visionnaire du PBR&B, tandis que Starboy (2016) et After Hours (2020) révèlent sa capacité à marier synth‑pop, dream pop et R&B. Lauréat de multiples Grammy Awards, il explore constamment de nouvelles sonorités et repousse les limites du genre, tout en restant fidèle à son univers nocturne et introspectif. '),
(2, 'Metro Boomin', 'Leland Tyler Wayne, dit Metro Boomin, voit le jour le 16 septembre 1993 à St. Louis, Missouri. Prodige du beatmaking, il s’installe à Atlanta et devient, dès 2013, le producteur attitré de la trap américaine, collaborant avec Future, Drake, 21 Savage, Migos et Travis Scott. Son style, à la fois sombre, mélodique et lourd en basses, redéfinit le son hip‑hop contemporain. Après plusieurs mixtapes à succès, il sort en 2018 Not All Heroes Wear Capes, suivi en 2022 par Heroes & Villains, deux projets acclamés pour leur cohérence thématique et leur virtuosité de production.'),
(3, 'Khalid', 'Khalid Donnel Robinson, né le 11 février 1998 à Fort Stewart (Géorgie) et élevé à El Paso (Texas), connaît la célébrité en 2017 grâce au single Location, hymne R&B à la mélancolie douce. Son premier album, American Teen, atteint le top 10 aux États‑Unis et le platine international. Avec Free Spirit (2019), il confirme son talent pour les ballades soul teintées de pop et une écriture sensible sur l’adolescence et la quête d’identité. Apprécié pour son timbre chaud et ses textes authentiques, il collabore avec Billie Eilish, Normani et Logic. '),
(4, 'Ariana Grande', 'Née le 26 juin 1993 à Boca Raton (Floride), Ariana Grande‑Butera débute comme actrice à Broadway puis dans la série Victorious. En 2013, son premier single The Way marque son entrée dans la pop mainstream. Dotée d’une tessiture exceptionnelle de quatre octaves, elle enchaîne les tubes (Problem, Side to Side, 7 Rings) et les albums multi‑platine (Yours Truly, Dangerous Woman, thank u, next, Positions). Engagée contre le terrorisme et pour la santé mentale, elle crée la One Love Manchester en 2017. Toujours en quête d’évolution, elle explore pop, R&B, trap et… même jazz pour surprendre son public. '),
(5, 'Kendrick Lamar', 'Kendrick Lamar Duckworth, né le 17 juin 1987 à Compton (Californie), débute en 2003 sous le pseudonyme K.Dot. Avec Section.80 (2011), il attire l’attention grâce à sa plume poétique et engagée. good kid, m.A.A.d city (2012) devient un classique pour son récit autobiographique de la vie en gangsta rap, tandis que To Pimp a Butterfly (2015) marie jazz, soul et hip‑hop politique pour capturer l’Amérique post‑Obama. Lauréat du Prix Pulitzer de musique pour DAMN. (2017), il est salué pour son innovation, son flow dynamique et sa capacité à aborder l’identité, la race et la résilience.'),
(6, 'Luther', 'Luther (prénom non divulgué), jeune sensation du rap français, se fait connaître dès 2019 sur SoundCloud et Instagram. Son univers mélange habilement R&B sensuel et rap urbain introspectif, porté par un timbre grave et des mélodies soignées. Dans ses EPs et singles (GARÇON, EXIT), il explore les thèmes de l’amour, du doute et de la construction de soi. Sans concessions, il cultive une esthétique musicale épurée, qui lui vaut un public fidèle et la reconnaissance de la critique indépendante. '),
(7, 'Dadju', 'Dadju Djuna Nsungula, né le 2 mai 1991 à Bobigny et d’origine congolaise, débute aux côtés de son frère Gims dans le duo The Shin Sekaï. En 2017, il se lance en solo avec Gentleman 2.0, classé numéro 1 en France. Son style R&B-pop aux influences afro, caractérisé par des refrains entêtants et des paroles romantiques, rencontre un grand succès avec des titres comme Reine et Django. Avec POISON OU ANTIDOTE (2020) et LIGNE DROITE (2021), il confirme sa place sur la scène urbaine francophone. '),
(8, 'Josman', 'Josman, de son vrai nom Josselin Mandou, naît le 19 août 1994 à Villeurbanne. Passé par YouTube et SoundCloud, il sort sa première mixtape en 2016. Son rap, oscillant entre trap sombre et mélodies planantes, se nourrit de thèmes introspectifs (solitude, ambition, questionnements sociaux). Avec les projets J.O.$, M.A.N et J.000.$, il se forge une identité unique, saluée pour sa plume affûtée et ses productions ambitieuses. Artiste indépendant, il cultive une connexion forte avec son public.'),
(9, 'Green Montana', 'Green Montana, nom de scène de Maxime Schaer, grandit entre Genève et Lyon. Signé sur Rec. 118, il se fait remarquer en 2018 via ses premiers EPs. Alliant trap mélancolique et cloud rap, il joue sur les contrastes entre beats atmosphériques et voix grave. Ses projets Millésime et NOSTALGIA+ abordent la mémoire, l’ambition et la nostalgie urbaine. En alliant minimalisme sonore et ambiances oniriques, il s’impose comme une figure singulière du rap francophone.'),
(10, 'Jok’air', 'Jok’air, de son vrai nom Alex Kadji, né en 1990 à Douala, s’impose en 2016 après avoir quitté le collectif 7 Jazzy Boys. Entre rap et R&B, il creuse des thèmes variés (amour, société, confiance en soi) sur des productions mêlant soul, trap et pop. Ses albums VI RÉPUBLIQUE (2019) et H₂O (2021) témoignent d’une écriture honnête et d’un sens aigu du storytelling. Son flow versatile et sa sensibilité artistique lui valent un public fidèle.'),
(11, 'PLK', 'PLK, alias Mathieu Pruski, naît le 15 avril 1997 à Clamart. Ancien élève d’école de commerce, il se tourne vers la musique et publie son premier EP en 2017. Son rap, à la frontière du trap et du mélodique, se distingue par des punchlines tranchantes autant que par des refrains accrocheurs. Avec Polak (2018), Mental (2020) et Vitamines (2022), il s’impose sur la scène francophone, collaborant avec Niska, Damso et Heuss L’Enfoiré. Son parcours allie éducation et authenticité urbaine. ');

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id_commentaire` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `texte` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `avis`
--

INSERT INTO `avis` (`id_commentaire`, `nom`, `texte`, `date`) VALUES
(1, 'Gabriel Roy', 'Un chef-d’œuvre, du début à la fin. Chaque morceau est soigneusement travaillé, et l’émotion est présente tout au long de l’album.', '2022-11-12'),
(2, 'Mathis Perrot', 'Bonne ambiance, mais un peu répétitif. Les sonorités restent agréables, mais manquent de renouvellement sur la durée.', '2023-11-27'),
(3, 'Victor Rouillard', 'La production est incroyable, j’adore ! Chaque beat est précis, l’ingénierie sonore est digne des meilleurs studios.', '2024-11-21'),
(4, 'Maxime Caron', 'Les paroles sont profondes et touchantes. On ressent une vraie sincérité dans l’écriture de l’artiste.', '2024-10-10'),
(5, 'Ethan Blanchard', 'Pas fan du style, trop expérimental pour moi. Cela dit, je reconnais l’audace et l’originalité de la démarche artistique.', '2025-12-14'),
(6, 'Hugo Moreau', 'Un vinyle que je recommande à tout le monde. Que vous soyez fan ou non, il y a forcément une piste qui vous parlera.', '2022-08-11'),
(7, 'Alice Guerin', 'La voix de l’artiste est trop autotunée. Cela finit par nuire à l’authenticité du message transmis.', '2024-06-03'),
(8, 'Lucas Lefèvre', 'Très bon mix entre classique et moderne. L’album parvient à équilibrer nostalgie et innovation musicale.', '2024-10-26'),
(9, 'Florence Vidal', 'Je l’écoute en boucle depuis sa sortie. Impossible de s’en lasser, tant l’univers est riche et envoûtant.', '2024-03-05'),
(10, 'Nathan Lambert', 'Trop commercial, manque d’originalité. On sent que c’est formaté pour plaire au grand public, au détriment de la personnalité.', '2023-02-26'),
(11, 'Thomas Girard', 'Un projet sous-estimé, mérite plus d’attention. Il contient des trésors cachés qui gagneraient à être connus.', '2025-03-18'),
(12, 'Paul Legrand', 'C’est juste correct, rien de marquant. Un album agréable mais qui ne laissera pas de trace durable.', '2022-11-23'),
(13, 'Inès Fontaine', 'Chaque piste est meilleure que la précédente. On sent une montée en puissance progressive qui captive l’auditeur.', '2022-03-31'),
(14, 'Enzo Masson', 'Belles collaborations sur ce vinyle. Les featurings apportent une vraie valeur ajoutée sans voler la vedette.', '2024-03-12'),
(15, 'Emma Dubois', 'Déçu… Je m’attendais à mieux. L’attente était grande, mais le projet ne tient pas toutes ses promesses.', '2022-05-08'),
(16, 'Chloé Bernard', 'L’un de mes albums préférés de l’année. Tout y est : émotions, sonorités variées, cohérence globale.', '2024-01-21'),
(17, 'Jade Roux', 'L’univers sonore est très immersif. On est littéralement transporté dans un autre monde pendant l’écoute.', '2025-02-10'),
(18, 'Alexandre Fabre', 'Quelques morceaux sont bons, d’autres oubliables. Une qualité inégale qui peut décevoir sur la longueur.', '2023-04-15'),
(19, 'Zoé Gauthier', 'Beaucoup trop de morceaux \"remplissage\". Cela dilue la force de l’album, qui aurait gagné à être plus concis.', '2025-02-13'),
(20, 'Camille Fontaine', 'L’artiste montre une vraie évolution. On perçoit une maturité nouvelle dans la façon de construire les morceaux.', '2024-08-05'),
(21, 'Pauline Renaud', 'Rien de nouveau par rapport aux anciens albums. Les mêmes recettes sont utilisées, sans réelle prise de risque.', '2025-10-31'),
(22, 'Bastien Lemoine', 'Très cohérent, du début à la fin. Une narration musicale fluide qui donne du sens à l’ensemble.', '2025-02-27'),
(23, 'Léa Simon', 'Les beats sont fous ! Gros travail du producteur. Chaque instru apporte sa couleur propre au projet.', '2024-05-23'),
(24, 'Arthur Petit', 'Beaucoup trop court, à mon goût. On reste sur sa faim, comme si le voyage musical s’arrêtait trop vite.', '2024-02-07'),
(25, 'Adrien Castille', 'Ça tourne en rond, rapidement. Les thèmes et les ambiances finissent par se répéter sans grande surprise.', '2025-03-15'),
(26, 'Louis Marchand', 'J’ai redécouvert l’artiste avec ce vinyle. Une vraie révélation qui montre l’étendue de son talent.', '2022-06-14'),
(27, 'Elodie Schmitt', 'Beaucoup d’émotions dans les textes. Les paroles sont poignantes et reflètent une belle sensibilité.', '2023-10-22'),
(28, 'Julie Noël', 'Le flow ne colle pas à l’instru. Il y a un certain décalage qui empêche l’ensemble de vraiment décoller.', '2024-05-25'),
(29, 'Léonard Dufresne', 'Une pépite cachée, à écouter d’urgence. Un projet confidentiel, mais d’une rare intensité artistique.', '2024-01-09'),
(30, 'Quentin André', 'On sent que l’artiste s’est cherché ici. Ce n’est pas toujours abouti, mais la démarche reste passionnante.', '2023-11-14'),
(31, 'Léonard Dufresne', 'J’ai adoré le storytelling. Chaque titre raconte une histoire qui contribue à créer une œuvre cohérente.', '2024-01-09'),
(32, 'Julie Boucher', 'Concept original, et bien exécuté. Une vraie proposition artistique qui sort des sentiers battus.', '2023-11-14'),
(33, 'Mathieu Leclerc', 'Trop de longueurs inutiles. Certains morceaux traînent en longueur et cassent le rythme général.', '2022-08-19'),
(34, 'Sophie Carrière', 'Un bon moment, sans plus. Un disque qui s’écoute bien, mais qui ne marque pas forcément les esprits.', '2023-03-13'),
(35, 'Gabriel Lemoine', 'Parfait pour chiller le soir. Ambiances douces et apaisantes qui créent une belle atmosphère.', '2024-07-05'),
(36, 'Marianne Dupont', 'Des morceaux énergiques et entraînants. Parfait pour se motiver ou bouger en rythme.', '2024-10-13'),
(37, 'Louis Chauvet', 'Très monotone… J’ai eu du mal à finir. Peu de relief ou de surprise tout au long de l’écoute.', '2022-04-15'),
(38, 'Claire Matisse', 'Une vraie claque musicale. Original, puissant et émouvant à la fois, c’est un sans-faute.', '2023-07-14'),
(39, 'Antoine Lefevre', 'Certains refrains restent en tête. De véritables tubes en puissance qui donnent envie d’y revenir.', '2022-12-30'),
(40, 'Élise Frémont', 'Pas de prise de risque, dommage. Le potentiel était là, mais l’artiste n’est pas sorti de sa zone de confort.', '2025-07-16'),
(41, 'Pierre Duval', 'Un retour réussi après plusieurs années d’absence. On retrouve tout ce qu’on aimait dans ses débuts, avec une touche de maturité.', '2024-06-18'),
(42, 'Florence Vidal', 'Production trop minimaliste, à mon goût. J’aurais préféré un peu plus de complexité dans les arrangements.', '2024-03-05'),
(43, 'Théo Dupuis', 'Un bijou sonore, tout simplement. À la fois subtil, puissant et parfaitement maîtrisé.', '2023-07-26'),
(44, 'Camille Marchal', 'Très répétitif, surtout vers la fin. L’album s’essouffle un peu, ce qui nuit à l’expérience globale.', '2022-01-27'),
(45, 'Victor Rouillard', 'Un projet touchant et sincère. On ressent que chaque chanson vient du cœur.', '2024-11-21'),
(46, 'Amandine Noël', 'Les feats n’apportent pas grand-chose. Ils semblent là pour le nom, pas pour la complémentarité musicale.', '2024-01-13'),
(47, 'Simon Perrot', 'Chaque morceau a son identité propre. C’est rare d’avoir autant de diversité dans un seul album.', '2024-12-23'),
(48, 'Claire Granger', 'Pas fan de la direction artistique. J’aurais aimé quelque chose de plus affirmé ou audacieux.', '2024-12-28'),
(49, 'Lucas Royer', 'Ça groove… J’adore ! Le rythme est accrocheur et donne une vraie envie de danser.', '2025-09-06'),
(50, 'Inès Fontaine', 'Mélancolique et apaisant. Une ambiance douce qui invite à la réflexion ou à la détente.', '2022-03-31'),
(51, 'Maxence Guillet', 'Une vraie expérimentation musicale. Ce n’est pas pour tout le monde, mais c’est audacieux.', '2024-12-27'),
(52, 'Alice Thibault', 'Un peu trop de clichés dans les textes. On aurait aimé plus de fraîcheur ou d’originalité.', '2022-12-31'),
(53, 'Bastien Delacroix', 'J’ai découvert un nouvel artiste favori. Cette écoute m’a clairement donné envie d’en savoir plus.', '2023-04-14'),
(54, 'Mélanie Besson', 'Un album qui divise, mais qui ne laisse pas indifférent. On aime ou on déteste, et c’est ce qui le rend intéressant.', '2022-11-18'),
(55, 'Henri Boulanger', 'Bonne surprise : je n’attendais rien. Finalement, j’ai été conquis dès les premières notes.', '2022-10-21'),
(56, 'Emilie Laurent', 'Un voyage musical captivant. Chaque morceau est une escale dans un univers unique.', '2025-06-10'),
(57, 'Paul Legrand', 'Les transitions entre les morceaux sont parfaites. Cela rend l’écoute fluide et agréable du début à la fin.', '2022-11-23'),
(58, 'Chloé Robert', 'L’ambiance générale est trop sombre pour moi. Cela plaira aux amateurs de mélancolie, mais ce n’est pas mon truc.', '2025-01-02'),
(59, 'Adrien Castille', 'Un classique instantané. Dès la première écoute, on sent que cet album va marquer son époque.', '2025-03-15'),
(60, 'Laetitia Simon', 'Une belle surprise… Je ne m’attendais à rien, et j’ai découvert un projet d’une grande richesse.', '2024-03-07');

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE `genres` (
  `id_genre` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `nombre_article` int(11) NOT NULL,
  `popularite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id_genre`, `nom`, `nombre_article`, `popularite`) VALUES
(1, 'R&B alternatif ', 2, 67),
(2, 'Pop ', 5, 95),
(3, 'Synth-pop ', 1, 75),
(4, 'R&B ', 4, 65),
(5, 'Trap ', 6, 98),
(6, 'Trap psychédélique ', 1, 61),
(7, 'R&B contemporain ', 1, 78),
(8, 'Rap West Coast ', 1, 79),
(9, 'Hip-hop West Coast ', 1, 75),
(10, 'R&B/Soul ', 2, 87),
(11, 'Hip-hop ', 1, 65),
(12, 'Rap', 5, 92);

-- --------------------------------------------------------

--
-- Structure de la table `vinyles`
--

CREATE TABLE `vinyles` (
  `id_vinyle` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `duree` time NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_artiste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vinyles`
--

INSERT INTO `vinyles` (`id_vinyle`, `titre`, `duree`, `prix`, `id_genre`, `id_artiste`) VALUES
(1, 'House of Balloons (Original)', '00:49:23', 30.99, 1, 1),
(2, 'Trilogy', '02:39:00', 29.99, 1, 1),
(3, 'Starboy', '01:08:00', 39.99, 2, 1),
(4, 'After Hours', '00:56:17', 26.99, 3, 1),
(5, 'Hurry Up Tomorrow', '01:24:00', 42.99, 4, 1),
(6, 'Without Warning', '00:33:29', 34.99, 5, 2),
(7, 'HEROES & VILLAINS', '00:48:04', 44.99, 6, 2),
(8, 'WE DON’T TRUST YOU', '00:59:47', 32.99, 5, 2),
(9, 'Free Spirit', '00:57:22', 30.99, 2, 3),
(10, 'Sincere', '00:52:10', 31.99, 7, 3),
(11, 'Dangerous Woman', '01:03:00', 21.99, 2, 4),
(12, 'thank u, next', '00:41:10', 30.99, 2, 4),
(13, 'Positions', '00:41:14', 42.99, 4, 4),
(14, 'eternal sunshine', '00:35:32', 22.99, 2, 4),
(15, 'good kid, m.A.A.d city', '01:18:00', 29.99, 8, 5),
(16, 'GNX', '00:44:20', 39.99, 9, 5),
(17, 'GARÇON', '00:21:05', 31.99, 10, 6),
(18, 'EXIT', '00:24:31', 42.99, 10, 6),
(19, 'Poison ou Antidote', '01:55:00', 35.99, 4, 7),
(20, 'HÉRITAGE', '01:12:00', 31.99, 4, 7),
(21, 'J.O.$', '00:54:27', 28.99, 11, 8),
(22, 'M.A.N (Black Roses & Lost Feelings)', '00:55:29', 42.99, 12, 8),
(23, 'J.000.$', '00:36:06', 30.99, 12, 8),
(24, 'NOSTALGIA+', '00:39:20', 35.99, 5, 9),
(25, 'SAUSADE', '00:40:55', 20.99, 5, 9),
(26, 'VI République (Version finale)', '01:05:00', 30.99, 12, 10),
(27, 'Melvin de Paris', '01:08:00', 28.99, 12, 10),
(28, 'Les jolies filles aiment Jok’air', '00:44:49', 23.99, 12, 10),
(29, 'Platinum', '00:54:49', 37.99, 5, 11),
(30, 'Mental', '00:59:30', 29.99, 5, 11);

-- --------------------------------------------------------

--
-- Structure de la table `vinyle_avis`
--

CREATE TABLE `vinyle_avis` (
  `id_vinyle` int(11) NOT NULL,
  `id_commentaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vinyle_avis`
--

INSERT INTO `vinyle_avis` (`id_vinyle`, `id_commentaire`) VALUES
(1, 1),
(1, 31),
(2, 2),
(2, 32),
(3, 3),
(3, 33),
(4, 4),
(4, 34),
(5, 5),
(5, 35),
(6, 6),
(6, 36),
(7, 7),
(7, 37),
(8, 8),
(8, 38),
(9, 9),
(9, 39),
(10, 10),
(10, 40),
(11, 11),
(11, 41),
(12, 12),
(12, 42),
(13, 13),
(13, 43),
(14, 14),
(14, 44),
(15, 15),
(15, 45),
(16, 16),
(16, 46),
(17, 17),
(17, 47),
(18, 18),
(18, 48),
(19, 19),
(19, 49),
(20, 20),
(20, 50),
(21, 21),
(21, 51),
(22, 22),
(22, 52),
(23, 23),
(23, 53),
(24, 24),
(24, 54),
(25, 25),
(25, 55),
(26, 26),
(26, 56),
(27, 27),
(27, 57),
(28, 28),
(28, 58),
(29, 29),
(29, 59),
(30, 30),
(30, 60);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artistes`
--
ALTER TABLE `artistes`
  ADD PRIMARY KEY (`id_artiste`);

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id_commentaire`);

--
-- Index pour la table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id_genre`);

--
-- Index pour la table `vinyles`
--
ALTER TABLE `vinyles`
  ADD PRIMARY KEY (`id_vinyle`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_artiste` (`id_artiste`);

--
-- Index pour la table `vinyle_avis`
--
ALTER TABLE `vinyle_avis`
  ADD PRIMARY KEY (`id_vinyle`,`id_commentaire`),
  ADD KEY `id_commentaire` (`id_commentaire`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artistes`
--
ALTER TABLE `artistes`
  ADD CONSTRAINT `artistes_ibfk_1` FOREIGN KEY (`id_artiste`) REFERENCES `artiste_genre` (`id_artiste`);

--
-- Contraintes pour la table `vinyles`
--
ALTER TABLE `vinyles`
  ADD CONSTRAINT `vinyles_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`),
  ADD CONSTRAINT `vinyles_ibfk_2` FOREIGN KEY (`id_artiste`) REFERENCES `artistes` (`id_artiste`);

--
-- Contraintes pour la table `vinyle_avis`
--
ALTER TABLE `vinyle_avis`
  ADD CONSTRAINT `vinyle_avis_ibfk_1` FOREIGN KEY (`id_vinyle`) REFERENCES `vinyles` (`id_vinyle`),
  ADD CONSTRAINT `vinyle_avis_ibfk_2` FOREIGN KEY (`id_commentaire`) REFERENCES `avis` (`id_commentaire`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
