<?php

$projects_web = [
    [
        'id' => 1,
        'titre' => 'Netflix',
        'desc_courte' => 'Un de mes premiers projets réalisé lors des cours du module WEB où j\'ai pu apprendres les fondamentaux du HTML/CSS et les mettre en pratique en réalisant une copie du site web Netflix.',
        'date' => 'Novembre 2024',
        'lien' => 'projects/netflix/index.html',
        'photos' => [
            'img/netflix/1.png',
            'img/netflix/2.png',
            'img/netflix/3.png',
        ]
    ],
    [
        'id' => 2,
        'titre' => 'YFNSM',
        'desc_courte' => 'Le premier devoir évalué du module WEB où le choix du sujet était libre, j\'ai donc choisi de créer un site web sur mon super héro préféré et son univers : Spider-Man. J\'y présente différents personnages, acteurs et films.',
        'date' => 'Janvier 2025',
        'lien' => 'projects/spider/accueil.html',
        'photos' => [
            'img/yfnsm/1.png',
            'img/yfnsm/2.png',
            'img/yfnsm/3.png',
            'img/yfnsm/4.png',
            'img/yfnsm/5.png',
        ]
    ],
    [
        'id' => 3,
        'titre' => 'Formula Drift',
        'desc_courte' => 'Ma première SAE (Situation d\'Apprentissage et d\'évaluation) du S1 où l\'utilisation de PHP/TWIG et MySQL était obligatoire. J\'ai, cette fois-ci, choisi de le faire sur la Formula Drift, une compétition de drift automobile en présentant des équipes et leurs pilotes, des circuits et des voitures adaptées.',
        'date' => 'Février 2025',
        'lien' => 'projects/formula/index_fr.php',
        'photos' => [
            'img/formula/1.png',
            'img/formula/2.png',
            'img/formula/3.png',
            'img/formula/4.png'
        ]
    ],
    [
        'id' => 4,
        'titre' => '33 Tours',
        'desc_courte' => 'Deuxième SAE du S2, j\'ai décidé de faire un site web sur les vinyles avec différents artistes que j\'écoute régulièrement. J\'y ai intégré une base de données pour présenter une collection de vinyles, divers artistes et genres.',
        'date' => 'Mars 2025',
        'lien' => 'projects/vinyle/index.php',
        'photos' => [
            'img/vinyle/1.png',
            'img/vinyle/2.png',
            'img/vinyle/3.png',
            'img/vinyle/4.png',
            'img/vinyle/5.png',
            'img/vinyle/6.png',
            'img/vinyle/7.png',
            'img/vinyle/8.png',
        ]
    ],
    [
        'id' => 5,
        'titre' => 'Archipelz',
        'desc_courte' => 'Dernière SAE de WEB du S4, j\'ai développé un site web sur les îles et archipels de la Polynésie française. Je me suis occupé de la partie front-end du projet en réalisant les maquettes et en intégrant les différentes pages du site tout en m\'inspirant de la direction artistique de Mario Sunshine.',
        'date' => 'Mars 2026',
        'lien' => 'projects/archipelz/polynesie/templates/home.html.twig',
        'photos' => [
            'img/archipelz/1.png',
            'img/archipelz/2.png',
            'img/archipelz/3.png',
            'img/archipelz/4.png',
            'img/archipelz/5.png',
            'img/archipelz/6.png',
            'img/archipelz/7.png',
        ]
    ],
    [
        'id' => 6,
        'titre' => 'Snake',
        'desc_courte' => 'Un rendu pour le module GAME où j\'ai réalisé une version du jeu Snake, j\'y ai intégré le mode de jeu classique, ainsi qu\'un mode Time Attack et Tunnels.',
        'date' => 'Avril 2026',
        'lien' => 'projects/snake/index.html',
        'photos' => [
            'img/snake/1.png',
            'img/snake/2.png',
            'img/snake/3.png',
        ]
    ],
];

$projects_game = [
    [
        'id' => 7,
        'titre' => 'I See You',
        'desc_courte' => 'Mon premier projet où j\'ai conçu un jeu vidéo dans une équipe de 4 personnes. J\'ai pu modéliser l\'environnement de mon niveau et des items comme la lampe torche sur Blender, créer des scripts pour le fonctionnement de certaines actions et assembler le tout sur Unity.',
        'date' => 'Avril 2026',
        'lien' => 'projects/netflix/isy/#',
        'photos' => [
            'img/isy/1.png',
            'img/isy/2.png',
            'img/isy/3.png',
        ]
    ],
];

// Combiner tous les projets
$projects = array_merge($projects_web, $projects_game);

// $projects_en = [
//     [
//         'id' => 1,
//         'titre' => 'Netflix',
//         'desc_courte' => 'One of my first projects completed during WEB module courses.',
//         'date' => 'Novembre 2024',
//         'lien' => 'projets/netflix/index.html'
//     ],
//     [
//         'id' => 2,
//         'titre' => 'YFNSM',
//         'desc_courte' => 'The first graded assignment of the WEB module where the subject choice was free, so I chose to create a website about my favorite superhero and his universe: Spider-Man.',
//         'date' => 'Janvier 2025',
//         'lien' => 'projets/spider/accueil.html'
//     ],
//     [
//         'id' => 3,
//         'titre' => 'Formula Drift',
//         'desc_courte' => 'My first SAE (Learning and Assessment Situation) of S1 where PHP/TWIG and MySQL usage was mandatory. This time, I chose to do it on Formula Drift, an automotive drifting competition.',
//         'date' => 'Février 2025',
//         'lien' => 'projets/formula/index_en.php'
//     ],
//     [
//         'id' => 4,
//         'titre' => '33 Tours',
//         'desc_courte' => 'Second SAE of S2, I decided to create a website about vinyl records with different artists I listen to regularly. I integrated a database to present a vinyl collection, various artists and genres.',
//         'date' => 'Mars 2025',
//         'lien' => 'projets/vinyle/index.php'
//     ],
// ];
