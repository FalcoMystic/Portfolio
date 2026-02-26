-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 19 mai 2025 à 17:46
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
  `photo` varchar(255) DEFAULT NULL,
  `banniere` varchar(255) DEFAULT NULL,
  `biographie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `artistes`
--

INSERT INTO `artistes` (`id_artiste`, `nom`, `photo`, `banniere`, `biographie`) VALUES
(1, 'The Weeknd', '1.webp', '1.webp', 'Abel Makkonen Tesfaye, né le 16 février 1990 à Toronto, se fait remarquer en 2010 en publiant anonymement ses premières chansons sur YouTube. Son premier projet, House of Balloons (2011), impose son style sombre et éthéré, fusion d’alternative R&B, de trip hop et d’indie pop. Avec Trilogy (2012), il consolide son statut de visionnaire du PBR&B, tandis que Starboy (2016) et After Hours (2020) révèlent sa capacité à marier synth‑pop, dream pop et R&B. Lauréat de multiples Grammy Awards, il explore constamment de nouvelles sonorités et repousse les limites du genre, tout en restant fidèle à son univers nocturne et introspectif. '),
(2, 'Metro Boomin', '2.webp', '2.webp', 'Leland Tyler Wayne, dit Metro Boomin, voit le jour le 16 septembre 1993 à St. Louis, Missouri. Prodige du beatmaking, il s’installe à Atlanta et devient, dès 2013, le producteur attitré de la trap américaine, collaborant avec Future, Drake, 21 Savage, Migos et Travis Scott. Son style, à la fois sombre, mélodique et lourd en basses, redéfinit le son hip‑hop contemporain. Après plusieurs mixtapes à succès, il sort en 2018 Not All Heroes Wear Capes, suivi en 2022 par Heroes & Villains, deux projets acclamés pour leur cohérence thématique et leur virtuosité de production.'),
(3, 'Khalid', '3.webp', '3.webp', 'Khalid Donnel Robinson, né le 11 février 1998 à Fort Stewart (Géorgie) et élevé à El Paso (Texas), connaît la célébrité en 2017 grâce au single Location, hymne R&B à la mélancolie douce. Son premier album, American Teen, atteint le top 10 aux États‑Unis et le platine international. Avec Free Spirit (2019), il confirme son talent pour les ballades soul teintées de pop et une écriture sensible sur l’adolescence et la quête d’identité. Apprécié pour son timbre chaud et ses textes authentiques, il collabore avec Billie Eilish, Normani et Logic. '),
(4, 'Ariana Grande', '4.webp', '4.webp', 'Née le 26 juin 1993 à Boca Raton (Floride), Ariana Grande‑Butera débute comme actrice à Broadway puis dans la série Victorious. En 2013, son premier single The Way marque son entrée dans la pop mainstream. Dotée d’une tessiture exceptionnelle de quatre octaves, elle enchaîne les tubes (Problem, Side to Side, 7 Rings) et les albums multi‑platine (Yours Truly, Dangerous Woman, thank u, next, Positions). Engagée contre le terrorisme et pour la santé mentale, elle crée la One Love Manchester en 2017. Toujours en quête d’évolution, elle explore pop, R&B, trap et… même jazz pour surprendre son public. '),
(5, 'Kendrick Lamar', '5.webp', '5.webp', 'Kendrick Lamar Duckworth, né le 17 juin 1987 à Compton (Californie), débute en 2003 sous le pseudonyme K.Dot. Avec Section.80 (2011), il attire l’attention grâce à sa plume poétique et engagée. good kid, m.A.A.d city (2012) devient un classique pour son récit autobiographique de la vie en gangsta rap, tandis que To Pimp a Butterfly (2015) marie jazz, soul et hip‑hop politique pour capturer l’Amérique post‑Obama. Lauréat du Prix Pulitzer de musique pour DAMN. (2017), il est salué pour son innovation, son flow dynamique et sa capacité à aborder l’identité, la race et la résilience.'),
(6, 'Luther', '6.webp', '6.webp', 'Luther (prénom non divulgué), jeune sensation du rap français, se fait connaître dès 2019 sur SoundCloud et Instagram. Son univers mélange habilement R&B sensuel et rap urbain introspectif, porté par un timbre grave et des mélodies soignées. Dans ses EPs et singles (GARÇON, EXIT), il explore les thèmes de l’amour, du doute et de la construction de soi. Sans concessions, il cultive une esthétique musicale épurée, qui lui vaut un public fidèle et la reconnaissance de la critique indépendante. '),
(7, 'Dadju', '7.webp', '7.webp', 'Dadju Djuna Nsungula, né le 2 mai 1991 à Bobigny et d’origine congolaise, débute aux côtés de son frère Gims dans le duo The Shin Sekaï. En 2017, il se lance en solo avec Gentleman 2.0, classé numéro 1 en France. Son style R&B-pop aux influences afro, caractérisé par des refrains entêtants et des paroles romantiques, rencontre un grand succès avec des titres comme Reine et Django. Avec POISON OU ANTIDOTE (2020) et LIGNE DROITE (2021), il confirme sa place sur la scène urbaine francophone. '),
(8, 'Josman', '8.webp', '8.webp', 'Josman, de son vrai nom Josselin Mandou, naît le 19 août 1994 à Villeurbanne. Passé par YouTube et SoundCloud, il sort sa première mixtape en 2016. Son rap, oscillant entre trap sombre et mélodies planantes, se nourrit de thèmes introspectifs (solitude, ambition, questionnements sociaux). Avec les projets J.O.$, M.A.N et J.000.$, il se forge une identité unique, saluée pour sa plume affûtée et ses productions ambitieuses. Artiste indépendant, il cultive une connexion forte avec son public.'),
(9, 'Green Montana', '9.webp', '9.webp', 'Green Montana, nom de scène de Maxime Schaer, grandit entre Genève et Lyon. Signé sur Rec. 118, il se fait remarquer en 2018 via ses premiers EPs. Alliant trap mélancolique et cloud rap, il joue sur les contrastes entre beats atmosphériques et voix grave. Ses projets Millésime et NOSTALGIA+ abordent la mémoire, l’ambition et la nostalgie urbaine. En alliant minimalisme sonore et ambiances oniriques, il s’impose comme une figure singulière du rap francophone.'),
(10, 'Jok’air', '10.webp', '10.webp', 'Jok’air, de son vrai nom Alex Kadji, né en 1990 à Douala, s’impose en 2016 après avoir quitté le collectif 7 Jazzy Boys. Entre rap et R&B, il creuse des thèmes variés (amour, société, confiance en soi) sur des productions mêlant soul, trap et pop. Ses albums VI RÉPUBLIQUE (2019) et H₂O (2021) témoignent d’une écriture honnête et d’un sens aigu du storytelling. Son flow versatile et sa sensibilité artistique lui valent un public fidèle.'),
(11, 'PLK', '11.webp', '11.webp', 'PLK, alias Mathieu Pruski, naît le 15 avril 1997 à Clamart. Ancien élève d’école de commerce, il se tourne vers la musique et publie son premier EP en 2017. Son rap, à la frontière du trap et du mélodique, se distingue par des punchlines tranchantes autant que par des refrains accrocheurs. Avec Polak (2018), Mental (2020) et Vitamines (2022), il s’impose sur la scène francophone, collaborant avec Niska, Damso et Heuss L’Enfoiré. Son parcours allie éducation et authenticité urbaine. ');

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id_commentaire` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
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
(60, 'Laetitia Simon', 'Une belle surprise… Je ne m’attendais à rien, et j’ai découvert un projet d’une grande richesse.', '2024-03-07'),
(61, 'Matteo Mehl', '10/10', '2025-05-19'),
(62, 'Rodet Lucas', 'Le début de l\'album est bien mais on se lasse très vite des similitudes entre tout les sons de l\'albums, dommage...', '2025-05-19');

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE `genres` (
  `id_genre` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `nombre_article` int(11) NOT NULL,
  `popularite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id_genre`, `nom`, `image`, `description`, `nombre_article`, `popularite`) VALUES
(1, 'R&B alternatif', '1.webp', 'Ce genre fusionne les bases traditionnelles du R&B avec des sonorités expérimentales et des influences issues de l\'électro, du rock ou du hip-hop. Il se distingue par des rythmes lents, des textures sonores innovantes et des paroles introspectives souvent émotionnelles.', 2, 67),
(2, 'Pop', '2.webp', 'La pop est un genre musical accessible et entraînant, caractérisé par des refrains accrocheurs, des structures répétitives et une production soignée. Elle puise souvent dans d\'autres styles pour rester moderne, tout en visant un large public à travers les époques.', 5, 95),
(3, 'Synth-pop', '3.webp', 'Issu des années 1980, le synth-pop repose sur l\'utilisation dominante de synthétiseurs et de boîtes à rythmes. Il combine des mélodies pop avec une atmosphère électronique souvent nostalgique, offrant un son à la fois rétro et intemporel dans la culture musicale.', 1, 75),
(4, 'R&B', '4.webp', 'Le R&B (Rhythm and Blues) se caractérise par une forte présence rythmique, des mélodies riches et des textes émotionnels. Il est né de la soul et du gospel, et reste un pilier majeur de la musique contemporaine en évoluant avec les courants modernes.', 4, 65),
(5, 'Trap', '5.webp', 'Le trap est un sous-genre du hip-hop né dans le sud des États-Unis. Il est marqué par ses 808 puissants, ses hi-hats rapides, ses rythmes sombres et ses paroles crues. Il est devenu un style influent à l’échelle mondiale dans la production urbaine.', 6, 98),
(6, 'Trap psychédélique', '6.webp', 'Fusion entre les sons hypnotiques du psychédélisme et l’intensité du trap, ce genre explore des atmosphères planantes, des effets sonores distordus et des beats profonds. Il se distingue par une ambiance immersive et souvent introspective.', 1, 61),
(7, 'R&B contemporain', '7.webp', 'Ce style moderne conserve l’essence émotionnelle du R&B classique, tout en l’enrichissant de sonorités électroniques, de beats hip-hop et de productions digitales sophistiquées. Il s\'adresse aux amateurs de ballades sensuelles et de voix expressives.', 1, 78),
(8, 'Rap West Coast', '8.webp', 'Le rap West Coast a émergé en Californie dans les années 1980 et 1990 avec des artistes emblématiques. Il se caractérise par des basses lourdes, des rythmes détendus et un flow distinctif. Il véhicule souvent des récits de rue et une identité locale forte.', 1, 79),
(9, 'Hip-hop West Coast', '9.webp', 'Ce sous-genre du hip-hop met l’accent sur des beats funk, des synthés \"G-Funk\", et une vibe relax propre à la côte ouest. Il est indissociable des cultures urbaines californiennes et a marqué l’histoire du rap avec des artistes iconiques.', 1, 75),
(10, 'R&B/Soul', '10.webp', 'Cette fusion réunit la puissance émotionnelle de la soul avec la modernité du R&B. Le genre est porté par des voix expressives, des arrangements chaleureux et des textes intimes. Il s’adresse à ceux qui cherchent à ressentir la musique dans toute sa profondeur.', 2, 87),
(11, 'Hip-hop', '11.webp', 'Le hip-hop est bien plus qu’un style musical : c’est un mouvement culturel. Il repose sur le rap, le beatmaking, le sampling et le flow. Ses textes abordent des thèmes sociaux, personnels ou politiques, avec créativité, force et identité.', 1, 65),
(12, 'Rap', '12.webp', 'Le rap est l\'art de la parole rythmée sur une instrumentale. Il peut être engagé, introspectif, festif ou provocateur. Il valorise la performance lyrique, la rime et le message, et reste l’un des genres les plus influents de la musique moderne.', 5, 92);

-- --------------------------------------------------------

--
-- Structure de la table `sons`
--

CREATE TABLE `sons` (
  `id_son` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `popularite` int(11) DEFAULT NULL,
  `id_vinyle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sons`
--

INSERT INTO `sons` (`id_son`, `titre`, `duree`, `popularite`, `id_vinyle`) VALUES
(1, 'High For This', '00:04:09', 69, 1),
(2, 'What You Need', '00:03:26', 75, 1),
(3, 'House Of Balloons / Glass Table Girls', '00:06:47', 80, 1),
(4, 'The Morning', '00:05:14', 77, 1),
(5, 'Wicked Games', '00:05:25', 73, 1),
(6, 'The Party & The After Party', '00:07:40', 80, 1),
(7, 'Coming Down', '00:04:55', 81, 1),
(8, 'Loft Music', '00:06:03', 62, 1),
(9, 'The Knowing', '00:05:43', 60, 1),
(10, 'High For This', '00:04:09', 54, 2),
(11, 'What You Need', '00:03:26', 54, 2),
(12, 'House Of Balloons / Glass Table Girls', '00:06:47', 57, 2),
(13, 'The Morning', '00:05:14', 63, 2),
(14, 'Wicked Games', '00:05:25', 57, 2),
(15, 'The Party & The After Party', '00:07:40', 58, 2),
(16, 'Coming Down', '00:04:55', 58, 2),
(17, 'Loft Music', '00:06:03', 52, 2),
(18, 'The Knowing', '00:05:43', 51, 2),
(19, 'Twenty Eight', '00:04:18', 62, 2),
(20, 'Lonely Star', '00:05:49', 52, 2),
(21, 'Life Of The Party', '00:04:56', 53, 2),
(22, 'Thursday', '00:05:20', 50, 2),
(23, 'The Zone', '00:06:58', 55, 2),
(24, 'The Birds Pt. 1', '00:03:35', 54, 2),
(25, 'The Birds Pt. 2', '00:05:50', 59, 2),
(26, 'Gone', '00:08:07', 51, 2),
(27, 'Rolling Stone', '00:03:51', 50, 2),
(28, 'Heaven Or Las Vegas', '00:05:54', 47, 2),
(29, 'Valerie', '00:04:47', 58, 2),
(30, 'Starboy', '00:03:50', 91, 3),
(31, 'Party Monster', '00:04:09', 80, 3),
(32, 'False Alarm', '00:03:40', 66, 3),
(33, 'Reminder', '00:03:39', 84, 3),
(34, 'Rockin’', '00:03:53', 65, 3),
(35, 'Secrets', '00:04:26', 67, 3),
(36, 'True Colors', '00:03:26', 63, 3),
(37, 'Stargirl Interlude', '00:01:52', 76, 3),
(38, 'Sidewalks', '00:03:52', 75, 3),
(39, 'Six Feet Under', '00:03:58', 68, 3),
(40, 'Love To Lay', '00:03:43', 61, 3),
(41, 'A Lonely Night', '00:03:40', 65, 3),
(42, 'Attention', '00:03:17', 63, 3),
(43, 'Ordinary Life', '00:03:42', 63, 3),
(44, 'Nothing Without You', '00:03:19', 60, 3),
(45, 'All I Know', '00:05:21', 63, 3),
(46, 'Die For You', '00:04:20', 82, 3),
(47, 'I Feel It Coming', '00:04:29', 79, 3),
(48, 'Alone Again', '00:04:10', 67, 4),
(49, 'Too Late', '00:04:00', 67, 4),
(50, 'Hardest To Love', '00:03:31', 67, 4),
(51, 'Scared To Live', '00:03:11', 65, 4),
(52, 'Snowchild', '00:04:07', 65, 4),
(53, 'Escape From LA', '00:05:56', 68, 4),
(54, 'Heartless', '00:03:18', 80, 4),
(55, 'Faith', '00:04:43', 69, 4),
(56, 'Blinding Lights', '00:03:20', 91, 4),
(57, 'In Your Eyes', '00:03:58', 78, 4),
(58, 'Save Your Tears', '00:03:35', 88, 4),
(59, 'Repeat After Me (Interlude)', '00:03:16', 64, 4),
(60, 'After Hours', '00:06:01', 83, 4),
(61, 'Until I Bleed Out', '00:03:10', 63, 4),
(62, 'Wake Me Up (feat. Justice)', '00:05:08', 76, 5),
(63, 'Cry For Me', '00:03:44', 88, 5),
(64, 'I Can\'t Fucking Sing', '00:00:12', 23, 5),
(65, 'São Paulo (feat. Anitta)', '00:05:02', 88, 5),
(66, 'Until We\'re Skin & Bones', '00:00:22', 27, 5),
(67, 'Baptized In Fear', '00:03:52', 78, 5),
(68, 'Open Hearts', '00:03:55', 79, 5),
(69, 'Opening Night', '00:01:36', 73, 5),
(70, 'Reflections Laughing (feat. Travis Scott, Florence + The Machine)', '00:04:51', 77, 5),
(71, 'Enjoy The Show (feat. Future)', '00:05:01', 75, 5),
(72, 'Given Up On Me', '00:05:55', 74, 5),
(73, 'I Can\'t Wait To Get There', '00:03:09', 74, 5),
(74, 'Timeless (feat Playboi Carti)', '00:04:16', 95, 5),
(75, 'Niagara Falls', '00:04:37', 77, 5),
(76, 'Take Me Back To LA', '00:04:14', 75, 5),
(77, 'Big Sleep (feat. Giorgio Moroder)', '00:03:46', 70, 5),
(78, 'Give Me Mercy', '00:03:37', 71, 5),
(79, 'Drive', '00:03:08', 72, 5),
(80, 'The Abyss (feat. Lana Del Rey)', '00:04:43', 79, 5),
(81, 'Red Terror', '00:03:52', 70, 5),
(82, 'Ghostface Killers (feat. Travis Scott)', '00:04:29', 70, 6),
(83, 'Rap Saved Me (feat. Quavo)', '00:04:17', 67, 6),
(84, 'Ric Flair Drip (with Metro Boomin)', '00:02:53', 82, 6),
(85, 'My Choppa Hate Niggas', '00:02:29', 68, 6),
(86, 'Nightmare', '00:02:28', 57, 6),
(87, 'Mad Stalkers', '00:03:23', 63, 6),
(88, 'Disrespectful', '00:02:40', 58, 6),
(89, 'Run Up the Racks', '00:03:10', 54, 6),
(90, 'Still Serving', '00:03:52', 56, 6),
(91, 'Darth Vader', '00:03:49', 55, 6),
(92, 'On Time (with John Legend)', '00:02:49', 65, 7),
(93, 'Superhero (Heroes & Villains) [with Future & Chris Brown]', '00:03:02', 82, 7),
(94, 'Too Many Nights (feat. Don Toliver & with Future)', '00:03:20', 85, 7),
(95, 'Raindrops (Insane) [with Travis Scott]', '00:03:08', 74, 7),
(96, 'Umbrella (with 21 Savage & Young Nudy)', '00:03:42', 69, 7),
(97, 'Trance (with Travis Scott & Young Thug)', '00:03:15', 84, 7),
(98, 'Around Me (feat. Don Toliver)', '00:03:11', 80, 7),
(99, 'Metro Spider (with Young Thug)', '00:02:55', 68, 7),
(100, 'I Can\'t Save You (Interlude) [with Future & feat. Don Toliver]', '00:01:31', 73, 7),
(101, 'Creepin\' (with The Weeknd & 21 Savage)', '00:03:41', 84, 7),
(102, 'Niagara Falls (Foot or 2) [with Travis Scott & 21 Savage]', '00:03:28', 76, 7),
(103, 'Walk Em Down (Don\'t Kill Civilians) [with 21 Savage & feat. Mustafa]', '00:05:11', 66, 7),
(104, 'Lock On Me (with Travis Scott & Future)', '00:02:55', 65, 7),
(105, 'Feel The Fiyaaaah (with A$AP Rocky & feat. Takeoff)', '00:03:10', 69, 7),
(106, 'All The Money (with Gunna) [Bonus]', '00:02:47', 64, 7),
(107, 'We Don\'t Trust You', '00:03:46', 72, 8),
(108, 'Young Metro', '00:03:25', 74, 8),
(109, 'Ice Attack', '00:03:19', 67, 8),
(110, 'Type Shit', '00:03:48', 86, 8),
(111, 'Claustrophobic', '00:03:42', 61, 8),
(112, 'Like That', '00:04:28', 87, 8),
(113, 'Slimed In', '00:03:15', 62, 8),
(114, 'Magic Don Juan (Princess Diana)', '00:03:41', 63, 8),
(115, 'Cinderella', '00:02:50', 77, 8),
(116, 'Runnin Outta Time', '00:03:25', 63, 8),
(117, 'Fried (She a Vibe)', '00:03:30', 71, 8),
(118, 'Ain\'t No Love', '00:03:03', 60, 8),
(119, 'Everyday Hustle', '00:03:47', 72, 8),
(120, 'GTA', '00:03:53', 67, 8),
(121, 'Seen it All', '00:02:59', 58, 8),
(122, 'WTFYM', '00:04:53', 61, 8),
(123, 'Where My Twin @ - Bonus', '00:02:03', 58, 8),
(124, 'Intro', '00:03:33', 50, 9),
(125, 'Bad Luck', '00:03:52', 56, 9),
(126, 'My Bad', '00:02:44', 55, 9),
(127, 'Better', '00:03:49', 57, 9),
(128, 'Talk (feat. Disclosure)', '00:03:17', 73, 9),
(129, 'Right Back', '00:03:35', 57, 9),
(130, 'Don\'t Pretend', '00:02:46', 55, 9),
(131, 'Paradise', '00:02:53', 51, 9),
(132, 'Hundred', '00:04:37', 55, 9),
(133, 'Outta My Head (with John Mayer)', '00:02:57', 64, 9),
(134, 'Free Spirit', '00:03:02', 57, 9),
(135, 'Twenty One', '00:03:04', 52, 9),
(136, 'Bluffin\'', '00:03:19', 49, 9),
(137, 'Self', '00:03:50', 49, 9),
(138, 'Alive', '00:02:58', 50, 9),
(139, 'Heaven', '00:03:33', 48, 9),
(140, 'Saturday Nights', '00:03:32', 54, 9),
(141, 'Adore U', '00:02:44', 56, 10),
(142, 'Everything We See', '00:03:24', 51, 10),
(143, 'Altitude', '00:02:38', 50, 10),
(144, 'It\'s All Good', '00:03:29', 52, 10),
(145, 'Broken', '00:03:45', 47, 10),
(146, 'Dose', '00:03:59', 48, 10),
(147, 'Please Don\'t Fall In Love With Me', '00:02:58', 61, 10),
(148, 'Breathe', '00:02:50', 46, 10),
(149, 'Ground', '00:03:02', 47, 10),
(150, 'Who\'s There To Pick Me Up', '00:03:30', 44, 10),
(151, 'Tainted', '00:03:03', 46, 10),
(152, 'Long Way Home', '00:02:17', 46, 10),
(153, 'Heatstroke', '00:03:55', 63, 10),
(154, 'Sincere', '00:03:29', 48, 10),
(155, 'Owe To You', '00:03:41', 48, 10),
(156, 'Decline', '00:03:25', 47, 10),
(157, 'Moonlight', '00:03:22', 64, 11),
(158, 'Dangerous Woman', '00:03:56', 68, 11),
(159, 'Be Alright', '00:02:59', 62, 11),
(160, 'Into You', '00:04:04', 70, 11),
(161, 'Side To Side', '00:03:46', 67, 11),
(162, 'Let Me Love You', '00:03:44', 62, 11),
(163, 'Greedy', '00:03:35', 61, 11),
(164, 'Leave Me Lonely', '00:03:50', 58, 11),
(165, 'Everyday', '00:03:15', 64, 11),
(166, 'Sometimes', '00:03:47', 59, 11),
(167, 'I Don\'t Care', '00:02:58', 55, 11),
(168, 'Bad Decisions', '00:03:46', 58, 11),
(169, 'Touch It', '00:04:20', 65, 11),
(170, 'Knew Better / Forever Boy', '00:04:59', 58, 11),
(171, 'Thinking Bout You', '00:03:20', 61, 11),
(172, 'Step On Up', '00:03:01', 62, 11),
(173, 'Jason\'s Song (Gave It Away)', '00:04:25', 54, 11),
(174, 'imagine', '00:03:32', 70, 12),
(175, 'needy', '00:02:52', 73, 12),
(176, 'NASA', '00:03:02', 66, 12),
(177, 'bloodline', '00:03:37', 80, 12),
(178, 'fake smile', '00:03:29', 64, 12),
(179, 'bad idea', '00:04:27', 68, 12),
(180, 'make up', '00:02:20', 62, 12),
(181, 'ghostin', '00:04:31', 70, 12),
(182, 'in my head', '00:03:43', 70, 12),
(183, '7 rings', '00:02:59', 85, 12),
(184, 'thank u, next', '00:03:28', 82, 12),
(185, 'break up with your girlfriend, i\'m bored', '00:03:10', 77, 12),
(186, 'shut up', '00:02:38', 60, 13),
(187, '34+35', '00:02:54', 78, 13),
(188, 'motive (with Doja Cat)', '00:02:48', 74, 13),
(189, 'just like magic', '00:02:30', 67, 13),
(190, 'off the table (with The Weeknd)', '00:04:00', 65, 13),
(191, 'six thirty', '00:03:04', 58, 13),
(192, 'safety net (feat. Ty Dolla $ign)', '00:03:28', 70, 13),
(193, 'my hair', '00:02:38', 63, 13),
(194, 'nasty', '00:03:21', 68, 13),
(195, 'west side', '00:02:12', 64, 13),
(196, 'love language', '00:03:00', 61, 13),
(197, 'positions', '00:02:52', 80, 13),
(198, 'obvious', '00:02:27', 62, 13),
(199, 'pov', '00:03:22', 76, 13),
(200, 'intro (end of the world)', '00:01:32', 82, 14),
(201, 'bye', '00:02:44', 77, 14),
(202, 'don\'t wanna break up again', '00:02:54', 74, 14),
(203, 'Saturn Returns Interlude', '00:00:42', 62, 14),
(204, 'eternal sunshine', '00:03:30', 77, 14),
(205, 'supernatural', '00:02:43', 85, 14),
(206, 'true story', '00:02:43', 69, 14),
(207, 'the boy is mine', '00:02:53', 83, 14),
(208, 'yes, and?', '00:03:35', 77, 14),
(209, 'we can\'t be friends (wait for your love)', '00:03:49', 89, 14),
(210, 'i wish i hated you', '00:02:34', 72, 14),
(211, 'imperfect for you', '00:03:02', 71, 14),
(212, 'ordinary things (feat. Nonna)', '00:02:41', 65, 14),
(213, 'Sherane a.k.a Master Splinter’s Daughter', '00:04:34', 51, 15),
(214, 'Bitch, Don’t Kill My Vibe', '00:05:11', 70, 15),
(215, 'Backseat Freestyle', '00:03:32', 64, 15),
(216, 'The Art of Peer Pressure', '00:05:25', 56, 15),
(217, 'Money Trees', '00:06:27', 85, 15),
(218, 'Poetic Justice', '00:05:00', 70, 15),
(219, 'good kid', '00:03:34', 57, 15),
(220, 'm.A.A.d city', '00:05:50', 68, 15),
(221, 'Swimming Pools (Drank) - Extended Version', '00:05:14', 67, 15),
(222, 'Sing About Me, I\'m Dying Of Thirst', '00:12:04', 59, 15),
(223, 'Real', '00:07:23', 55, 15),
(224, 'Compton', '00:04:08', 53, 15),
(225, 'Bitch, Don’t Kill My Vibe - Remix', '00:04:38', 55, 15),
(226, 'Bitch, Don’t Kill My Vibe - International Remix / Explicit Version', '00:05:06', 42, 15),
(227, 'wacced out murals', '00:05:17', 78, 16),
(228, 'squabble up', '00:02:38', 89, 16),
(229, 'luther (with sza)', '00:02:58', 92, 16),
(230, 'man at the garden', '00:03:53', 75, 16),
(231, 'hey now (feat. dody6)', '00:03:37', 81, 16),
(232, 'reincarnated', '00:04:36', 78, 16),
(233, 'tv off (feat. lefty gunplay)', '00:03:41', 93, 16),
(234, 'dodger blue (feat. wallie the sensei, siete7x, roddy ricch)', '00:02:11', 79, 16),
(235, 'peekaboo (feat. azchike)', '00:02:36', 86, 16),
(236, 'heart pt. 6', '00:04:52', 78, 16),
(237, 'gnx (feat. hitta j3, youngthreat, peysoh)', '00:03:14', 72, 16),
(238, 'gloria (with sza)', '00:04:47', 78, 16),
(239, 'PK TU M\'APL ?', '00:03:02', 49, 17),
(240, 'ALAKAZAM', '00:03:05', 55, 17),
(241, 'BLAKE & MORTIMER', '00:01:40', 54, 17),
(242, 'MA VIE D\'AVANT', '00:03:08', 52, 17),
(243, 'LESSGUI', '00:02:35', 54, 17),
(244, 'LE SANG', '00:02:50', 47, 17),
(245, 'TORIEL - VENI VIDI VIDE', '00:02:21', 53, 17),
(246, 'GARÇON', '00:02:25', 59, 17),
(247, 'PABO', '00:01:37', 48, 18),
(248, 'ROUGE GORON', '00:01:44', 45, 18),
(249, 'MOSSY COBBLESTONE', '00:02:10', 46, 18),
(250, 'T3', '00:02:35', 50, 18),
(251, 'JOURNAL DE QUÊTES', '00:02:51', 51, 18),
(252, 'SEUIL', '00:02:22', 49, 18),
(253, 'uSQUAD', '00:03:26', 49, 18),
(254, 'CHÂTEAU FORT', '00:02:41', 51, 18),
(255, 'LOOK', '00:01:44', 44, 18),
(256, 'ALED', '00:03:21', 57, 18),
(257, 'Amour toxic', '00:03:38', 64, 19),
(258, 'Grand bain', '00:03:27', 69, 19),
(259, 'Confessions', '00:04:13', 45, 19),
(260, 'Toi d\'abord', '00:03:58', 39, 19),
(261, 'Papa', '00:04:03', 38, 19),
(262, 'Compliqué', '00:03:35', 70, 19),
(263, 'Bobo au cœur', '00:03:41', 60, 19),
(264, 'Jure-le', '00:02:33', 36, 19),
(265, 'Please', '00:03:59', 39, 19),
(266, 'Paire d\'As', '00:04:07', 45, 19),
(267, 'Ma vie', '00:03:29', 61, 19),
(268, 'Mémoire courte', '00:03:40', 46, 19),
(269, 'Perdu', '00:03:45', 44, 19),
(270, 'TPB', '00:03:09', 58, 19),
(271, 'Ma faute', '00:03:52', 40, 19),
(272, 'Je ne t\'aime plus', '00:04:24', 49, 19),
(273, 'Normal', '00:03:22', 42, 19),
(274, 'Cette femme', '00:03:16', 40, 19),
(275, 'Promesse', '00:03:22', 36, 19),
(276, 'Robe', '00:03:44', 51, 19),
(277, 'Longue Vie', '00:02:01', 42, 20),
(278, 'Makila : Wablé - Version Acoustique', '00:02:04', 32, 20),
(279, 'Une semaine pour oublier...', '00:03:23', 31, 20),
(280, 'Apprends-moi !', '00:04:01', 35, 20),
(281, 'Makila : Wablé', '00:03:46', 33, 20),
(282, 'I love you', '00:03:58', 37, 20),
(283, 'TOUT essayer ?', '00:03:34', 36, 20),
(284, 'SOLD OUT !', '00:04:03', 34, 20),
(285, 'Le contrat', '00:03:51', 33, 20),
(286, 'Épouse-moi', '00:04:20', 33, 20),
(287, 'Victoria Secret', '00:04:18', 32, 20),
(288, 'LOOSE', '00:03:42', 29, 20),
(289, 'Option', '00:04:09', 27, 20),
(290, 'One Piece', '00:04:10', 31, 20),
(291, 'Bocca & Cuba Libre', '00:07:06', 28, 20),
(292, 'La vie d\'un... / Ma préférée', '00:04:46', 35, 20),
(293, 'Avant l\'hiver', '00:04:30', 29, 20),
(294, 'Je n\'ai que toi', '00:04:27', 29, 20),
(295, 'Fucked Up 3', '00:03:21', 47, 21),
(296, 'Loto', '00:03:09', 53, 21),
(297, 'DLVrai', '00:02:15', 43, 21),
(298, 'Fais Avec', '00:03:30', 38, 21),
(299, 'V&V', '00:03:18', 46, 21),
(300, 'TIM€', '00:03:29', 44, 21),
(301, 'BIZ', '00:03:25', 37, 21),
(302, 'Sourcils Froncés', '00:03:34', 41, 21),
(303, 'Un Zder, Un Thé', '00:02:49', 58, 21),
(304, 'WOW', '00:03:19', 44, 21),
(305, 'XS', '00:03:27', 66, 21),
(306, 'L\'Occasion', '00:03:43', 51, 21),
(307, 'Jeune N***', '00:04:23', 42, 21),
(308, 'J\'aime Bien!', '00:03:12', 67, 21),
(309, 'Ce soir j\'achèterai un Flash', '00:03:32', 48, 21),
(310, 'La Plaie', '00:04:00', 57, 21),
(311, 'Intro', '00:02:28', 67, 22),
(312, 'POP (feat. Guy2Bezbar)', '00:03:34', 47, 22),
(313, 'PLU$$$', '00:03:22', 45, 22),
(314, 'F̶i̶e̶s̶t̶a̶ (Interlude)', '00:02:30', 40, 22),
(315, 'Mort Ce soir', '00:02:33', 53, 22),
(316, 'L\'Œil de la Joconde', '00:03:09', 55, 22),
(317, 'L\'eau (Interlude)', '00:02:19', 42, 22),
(318, 'AhGars!', '00:03:46', 52, 22),
(319, 'Brûle', '00:03:32', 55, 22),
(320, 'Vaccin (feat. Sofiane Pamart)', '00:03:25', 43, 22),
(321, 'Ma Lady', '00:02:45', 42, 22),
(322, 'McQueen / Givenchy', '00:03:38', 45, 22),
(323, '3ein / Risotto Gambas', '00:04:26', 46, 22),
(324, 'Peace, Haine, Love', '00:04:01', 62, 22),
(325, 'Interdit (Interlude)', '00:02:23', 43, 22),
(326, 'Hasta el Cielo (feat. Eazy Dew & Soleil Noir)', '00:03:23', 39, 22),
(327, 'La Danse de la Joie', '00:04:17', 47, 22),
(328, 'Problèmes de Riche', '00:03:12', 54, 23),
(329, '50k€', '00:03:09', 50, 23),
(330, 'Les Flammes', '00:03:13', 53, 23),
(331, 'P.O.V.', '00:03:22', 48, 23),
(332, 'Yacht & Champagne - Skit', '00:01:30', 48, 23),
(333, 'Cohiba', '00:03:12', 55, 23),
(334, 'CARLO', '00:02:23', 54, 23),
(335, 'Cotton Club Freestyle - Remix', '00:01:11', 45, 23),
(336, 'Cocktail', '00:02:43', 50, 23),
(337, 'Apple Pay', '00:02:29', 41, 23),
(338, 'Ailleurs', '00:02:46', 64, 23),
(339, 'À feu doux...', '00:03:07', 48, 23),
(340, 'Rich Music', '00:03:49', 48, 23),
(341, 'PAPIERS', '00:02:43', 43, 24),
(342, 'WALDORF ASTORIA', '00:02:28', 41, 24),
(343, 'BEZOS-PINAULT-BOLLORE', '00:02:18', 40, 24),
(344, 'DIAMANT', '00:02:05', 37, 24),
(345, 'NEYMAR JR', '00:02:45', 55, 24),
(346, 'CHAQUE JOUR DE LA SEMAINE', '00:01:49', 52, 24),
(347, 'PARFUM', '00:01:40', 52, 24),
(348, 'MPIAKA', '00:02:34', 41, 24),
(349, 'LA OU LE VENT NOUS MENE', '00:01:53', 43, 24),
(350, 'SUPER HEROS', '00:01:47', 45, 24),
(351, 'BUGATTI BOYS', '00:02:05', 35, 24),
(352, 'CAMERA', '00:02:46', 36, 24),
(353, 'COMME TIME BOMB', '00:02:08', 35, 24),
(354, 'COCAINE COWBOY', '00:02:12', 36, 24),
(355, 'ADN', '00:01:40', 33, 24),
(356, 'ULTRAMAX400', '00:02:19', 35, 24),
(357, 'VEHICULE ALLEMAND', '00:02:07', 38, 24),
(358, 'LE ZEN ET LES SEINS', '00:02:10', 56, 24),
(359, 'phileas fogg', '00:01:40', 49, 25),
(360, 'ishtar', '00:02:11', 47, 25),
(361, 'bissap', '00:02:07', 42, 25),
(362, 'bank', '00:02:10', 54, 25),
(363, 'inspecteur gadget', '00:01:53', 40, 25),
(364, 'beverly hills 90210', '00:02:03', 45, 25),
(365, 'dashboard', '00:02:08', 47, 25),
(366, 'oseille mon amour', '00:03:11', 44, 25),
(367, 'saudade', '00:02:10', 50, 25),
(368, 'la brique et la drogue', '00:02:27', 40, 25),
(369, 'ekenge', '00:01:56', 42, 25),
(370, 'alfred borden', '00:01:47', 40, 25),
(371, 'riche nouveau monde', '00:02:19', 42, 25),
(372, 'barcelona92', '00:02:11', 67, 25),
(373, 'mc laren & likelemba', '00:02:09', 43, 25),
(374, 'la haine', '00:01:23', 43, 25),
(375, 'paire de celine', '00:02:28', 40, 25),
(376, 'finalement riche', '00:02:52', 43, 25),
(377, 'Je vous dis merci', '00:02:41', 27, 26),
(378, 'VI République', '00:02:45', 32, 26),
(379, 'Clic clac bang bang', '00:01:53', 53, 26),
(380, 'Ce soir je sors', '00:02:40', 44, 26),
(381, 'Les belles histoires', '00:04:29', 34, 26),
(382, 'Oui ou non', '00:02:10', 48, 26),
(383, 'Bonne bonne', '00:02:40', 38, 26),
(384, 'Elles ont trop joué avec mon coeur', '00:04:39', 68, 26),
(385, 'Sur la file de gauche', '00:03:56', 27, 26),
(386, 'Shap shap', '00:04:09', 24, 26),
(387, 'Uber eat netflix', '00:02:51', 28, 26),
(388, 'Vive arsenik', '00:03:43', 26, 26),
(389, 'Interlude / Ma tata', '00:04:06', 18, 26),
(390, 'La musique vient de la cité / Fresstyle la dictatrice', '00:03:04', 26, 26),
(391, 'Lignac', '00:04:46', 25, 26),
(392, 'Repose en paix Philippe', '00:02:40', 23, 26),
(393, '666', '00:01:57', 29, 26),
(394, 'Oh nana - Bonus track', '00:04:37', 43, 26),
(395, 'Nakamura - Bonus track', '00:03:20', 25, 26),
(396, 'Je vis cette mélodie', '00:03:37', 41, 27),
(397, 'Les artistes sont seul(e)s', '00:02:44', 38, 27),
(398, 'Vive le gang', '00:03:16', 55, 27),
(399, 'Tour en ville', '00:02:53', 47, 27),
(400, 'C.M.B', '00:06:25', 35, 27),
(401, 'Isma gère le business', '00:03:56', 34, 27),
(402, 'Soulja Boy', '00:02:33', 36, 27),
(403, 'Tu m\'as eu', '00:02:52', 46, 27),
(404, 'La seule qui m\'aime pour de vrai', '00:04:28', 55, 27),
(405, 'Quoi de neuf bébé', '00:02:58', 65, 27),
(406, 'Shawty', '00:03:05', 37, 27),
(407, 'Allons faire la fête on va mourir', '00:04:01', 41, 27),
(408, 'Nés pauvres', '00:03:28', 32, 27),
(409, 'Respect', '00:03:23', 34, 27),
(410, 'Mini Star', '00:02:53', 48, 27),
(411, 'Garde la tête haute', '00:03:21', 32, 27),
(412, 'Tous les jours c\'est samedi', '00:05:55', 33, 27),
(413, 'Downtown', '00:04:17', 34, 27),
(414, 'Fille à papa', '00:03:24', 50, 28),
(415, 'Pardon Yako', '00:03:17', 56, 28),
(416, 'MollyPop', '00:03:03', 49, 28),
(417, 'Ma meilleure amie', '00:04:44', 48, 28),
(418, 'Racaille Rockeur', '00:03:07', 49, 28),
(419, 'Oh la menteuse', '00:03:40', 64, 28),
(420, 'En apesanteur', '00:02:45', 53, 28),
(421, 'Madonna', '00:03:35', 47, 28),
(422, 'Go Shawty', '00:03:40', 45, 28),
(423, 'Ce n\'est que pour toi qu\'il bat', '00:02:47', 55, 28),
(424, 'Christian', '00:03:29', 46, 28),
(425, 'C\'est fou comme je l\'aime', '00:02:44', 48, 28),
(426, 'Erreur', '00:02:47', 50, 28),
(427, 'Tu ne me manques plus', '00:03:49', 45, 28),
(428, 'Pas besoin', '00:03:11', 38, 29),
(429, 'Mentalité', '00:03:14', 42, 29),
(430, 'Izé', '00:03:02', 34, 29),
(431, 'A A A', '00:02:57', 43, 29),
(432, 'La rue', '00:02:56', 33, 29),
(433, 'Pas les mêmes', '00:02:54', 45, 29),
(434, 'Homies', '00:03:58', 36, 29),
(435, 'Colis piégés (feat. Lefa)', '00:03:18', 36, 29),
(436, 'Platinum', '00:03:37', 35, 29),
(437, '260', '00:03:23', 40, 29),
(438, 'Copine', '00:03:33', 64, 29),
(439, 'High', '00:03:02', 40, 29),
(440, 'Niveau', '00:02:26', 32, 29),
(441, 'Dis-moi oui', '00:02:38', 52, 29),
(442, 'Go (feat. Krisy)', '00:03:19', 44, 29),
(443, 'C\'est grave', '00:03:19', 34, 29),
(444, 'Flamenco - Bonus Track', '00:03:38', 34, 29),
(445, 'Intr100000', '00:03:08', 36, 30),
(446, 'Un peu de haine', '00:03:20', 66, 30),
(447, 'Arai', '00:03:27', 46, 30),
(448, 'Toute l\'année (feat. Timal)', '00:03:01', 51, 30),
(449, 'Hola', '00:03:40', 60, 30),
(450, 'Travailler', '00:02:47', 40, 30),
(451, 'Nana', '00:03:16', 49, 30),
(452, 'Meilleur cauchemar', '00:03:18', 43, 30),
(453, 'Tout recommencer (feat. Tessa B)', '00:02:46', 62, 30),
(454, 'V2V', '00:02:56', 38, 30),
(455, 'Corazon (feat. Aladin 135)', '00:02:40', 38, 30),
(456, 'Le P', '00:03:19', 36, 30),
(457, 'Ma génération', '00:03:47', 41, 30),
(458, 'Mental', '00:03:25', 44, 30),
(459, 'Problèmes', '00:03:16', 66, 30),
(460, 'Cartelo (feat. Maes)', '00:03:12', 47, 30),
(461, 'RS3', '00:03:21', 40, 30),
(462, 'TT', '00:02:58', 42, 30),
(463, 'Temps perdu', '00:03:09', 42, 30);

-- --------------------------------------------------------

--
-- Structure de la table `vinyles`
--

CREATE TABLE `vinyles` (
  `id_vinyle` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `couverture` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duree` time NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `id_artiste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vinyles`
--

INSERT INTO `vinyles` (`id_vinyle`, `titre`, `couverture`, `description`, `duree`, `prix`, `id_genre`, `id_artiste`) VALUES
(1, 'House of Balloons (Original)', '1-1.webp', 'Premier opus marquant d’une trilogie sombre et atmosphérique, \"House of Balloons\" pose les bases du style unique de The Weeknd : un mélange de R&B alternatif, de pop éthérée et de récits nocturnes empreints de mélancolie, de luxure et de solitude.', '00:49:23', 30.99, 1, 1),
(2, 'Trilogy', '1-2.webp', 'Compilation monumentale regroupant les trois mixtapes fondatrices de The Weeknd (\"House of Balloons\", \"Thursday\", \"Echoes of Silence\"), \"Trilogy\" est un voyage immersif dans une esthétique noire, sensuelle et introspective.', '02:39:00', 29.99, 1, 1),
(3, 'Starboy', '1-3.webp', 'The Weeknd embrasse pleinement la pop futuriste sur \"Starboy\", un album explosif entre hits électro signés Daft Punk et balades mélancoliques, marquant sa transformation en icône internationale.', '01:08:00', 39.99, 2, 1),
(4, 'After Hours', '1-4.webp', 'Œuvre conceptuelle à l’esthétique 80s, \"After Hours\" mêle souffrances amoureuses et décadence nocturne dans un tourbillon sonore aussi catchy que tourmenté.', '00:56:17', 26.99, 3, 1),
(5, 'Hurry Up Tomorrow', '1-5.webp', 'Titre énigmatique évoquant une urgence douce-amère, \"Hurry Up Tomorrow\" pourrait désigner un projet introspectif, entre production planante et réflexions sur le temps qui presse sans jamais attendre.', '01:24:00', 42.99, 4, 1),
(6, 'Without Warning', '2-1.webp', 'Sorti par surprise, cet album est un pur concentré de trap brut et menaçante. Les productions sinistres de Metro rencontrent l\'agressivité maîtrisée de 21 Savage et Offset pour un résultat percutant.', '00:33:29', 34.99, 5, 2),
(7, 'HEROES & VILLAINS', '2-2.webp', 'Metro Boomin orchestre une épopée moderne entre lumière et obscurité, réunissant des figures emblématiques du rap pour un album dense, cinématographique et plein de contrastes.', '00:48:04', 44.99, 6, 2),
(8, 'WE DON’T TRUST YOU', '2-3.webp', 'Projet collaboratif aux sonorités sombres et incisives, où Metro Boomin façonne une ambiance glaciale sur laquelle Future crache sa méfiance tandis que The Weeknd, en invité de marque, ajoute sa touche éthérée.', '00:59:47', 32.99, 5, 2),
(9, 'Free Spirit', '3-1.webp', '\"Free Spirit\" capte la vibe d’un jeune adulte en quête de liberté et d’identité. Mélodies douces, touches électroniques et textes introspectifs font de cet album une ode à la transition et à la contemplation.', '00:57:22', 30.99, 2, 3),
(10, 'Sincere', '3-2.webp', 'Un album personnel où Brav mêle mélancolie, engagement et storytelling, \"Sincère\" touche par sa plume authentique et sa manière de naviguer entre rap et chanson française.', '00:52:10', 31.99, 7, 3),
(11, 'Dangerous Woman', '4-1.webp', 'Ariana s’affirme en femme fatale et indépendante avec cet opus aux influences R&B, pop et rock, qui marque un tournant plus mature dans sa discographie.', '01:03:00', 21.99, 2, 4),
(12, 'thank u, next', '4-2.webp', 'Suite directe d’un cœur brisé, cet album est un manifeste d’émancipation féminine, de résilience et d’acceptation de soi sur fond de productions pop modernes.', '00:41:10', 30.99, 2, 4),
(13, 'Positions', '4-3.webp', 'Entre sensualité maîtrisée et douceur vocale, Ariana explore l’amour, le plaisir et les rôles sociaux avec élégance, dans un style R&B feutré et minimaliste.', '00:41:14', 42.99, 4, 4),
(14, 'eternal sunshine', '4-4.webp', 'Ariana livre un projet intimiste et introspectif, à la fois doux et mélancolique, inspiré du film culte dont il reprend la philosophie émotionnelle.', '00:35:32', 22.99, 2, 4),
(15, 'good kid, m.A.A.d city', '5-1.webp', 'Chef-d\'œuvre narratif, ce projet explore la jeunesse de Kendrick à Compton. Entre pièges de la rue et quête de rédemption, il livre un témoignage puissant sur l’identité, la foi et le système.', '01:18:00', 29.99, 8, 5),
(16, 'GNX', '5-2.webp', 'Un album expérimental entre rap, chant et atmosphères planantes, \"GNX\" évoque des états d’âme intérieurs, porté par des mélodies lunaires et une écriture sensible.', '00:44:20', 39.99, 9, 5),
(17, 'GARÇON', '6-1.webp', 'Titre brut et émotionnel, cet album explore la masculinité, la fragilité et la rue avec une approche à la fois poétique et crue.', '00:21:05', 31.99, 10, 6),
(18, 'EXIT', '6-2.webp', 'Une porte de sortie artistique : \"EXIT\" est l’album d’une transition, mêlant espoir, abandon et élévation, dans un style souvent introspectif.', '00:24:31', 42.99, 10, 6),
(19, 'Poison ou Antidote', '7-1.webp', 'Album dualiste qui confronte le bien et le mal en chacun de nous. Entre tentations et guérison, le projet propose des morceaux profonds, percutants et contrastés.', '01:55:00', 35.99, 4, 7),
(20, 'HÉRITAGE', '7-2.webp', 'Un album-racines. Il revisite l’histoire familiale, culturelle ou musicale de l’artiste. Chaque track devient un legs à transmettre, une mémoire vivante.', '01:12:00', 31.99, 4, 7),
(21, 'J.O.$', '8-1.webp', 'Projet hybride mêlant trap, cloud rap et mélancolie, entre ego-trip et introspection. Un univers personnel et brut.', '00:54:27', 28.99, 11, 8),
(22, 'M.A.N (Black Roses & Lost Feelings)', '8-2.webp', 'Album sombre et romantique, oscillant entre amours perdus, douleurs intimes et fleurs noires. Une œuvre où la sensibilité masculine s’exprime sans filtre.', '00:55:29', 42.99, 12, 8),
(23, 'J.000.$', '8-3.webp', 'Projet complémentaire à J.O.$, avec une ambiance plus planante, où les pensées se diluent dans l’auto-analyse musicale.', '00:36:06', 30.99, 12, 8),
(24, 'NOSTALGIA+', '9-1.webp', 'Mélange entre souvenirs d’enfance, regrets passés et mélancolie numérique. La production mêle lo-fi, trap et samples vintage.', '00:39:20', 35.99, 5, 9),
(25, 'SAUSADE', '9-2.webp', 'Inspiré du mot portugais \"saudade\", cet album est une ode à l’absence, au manque, à ce que l’on n’a jamais vraiment eu. Introspectif et touchant.', '00:40:55', 20.99, 5, 9),
(26, 'VI République (Version finale)', '10-1.webp', 'Album engagé, \"VI République\" dresse un portrait acerbe de la société française actuelle, avec une plume tranchante et une conscience politique assumée.', '01:05:00', 30.99, 12, 10),
(27, 'Melvin de Paris', '10-2.webp', 'Portrait d’un enfant de la capitale, entre rêves brisés, amour de la ville et tensions sociales. Un récit urbain vibrant.', '01:08:00', 28.99, 12, 10),
(28, 'Les jolies filles aiment Jok’air', '10-3.webp', 'Jok’Air se livre dans un projet sentimental et séducteur, à la croisée du rap et de la variété. Ode à la féminité et à la tendresse.', '00:44:49', 23.99, 12, 10),
(29, 'Platinum', '11-1.webp', 'Symbole de succès, \"Platinum\" célèbre la réussite sans renier la douleur du passé. Alternance de bangers et de confessions.', '00:54:49', 37.99, 5, 11),
(30, 'Mental', '11-2.webp', 'Album centré sur la santé mentale, les doutes, les luttes internes et la force de continuer. Une œuvre forte, parfois sombre, toujours vraie.', '00:59:30', 29.99, 5, 11);

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
(3, 62),
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
(23, 61),
(23, 682),
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
(28, 682),
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
-- Index pour la table `sons`
--
ALTER TABLE `sons`
  ADD PRIMARY KEY (`id_son`),
  ADD KEY `id_vinyle` (`id_vinyle`);

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT pour la table `sons`
--
ALTER TABLE `sons`
  MODIFY `id_son` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3266;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artistes`
--
ALTER TABLE `artistes`
  ADD CONSTRAINT `artistes_ibfk_1` FOREIGN KEY (`id_artiste`) REFERENCES `artiste_genre` (`id_artiste`);

--
-- Contraintes pour la table `sons`
--
ALTER TABLE `sons`
  ADD CONSTRAINT `sons_ibfk_1` FOREIGN KEY (`id_vinyle`) REFERENCES `vinyles` (`id_vinyle`);

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
