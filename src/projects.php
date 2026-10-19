<?php

$projects_web = [
    [
        'id' => 1,
        'titre' => 'Netflix',
        'desc_courte' => 'Un de mes premiers projets réalisé lors des cours du module WEB où j\'ai pu apprendres les fondamentaux du HTML/CSS et les mettre en pratique en réalisant une copie du site web Netflix.',
        'date' => 'Novembre 2024',
        'lien' => 'projects/dev/netflix/index.html',
        'photos' => [
            'img/dev/netflix/1.png',
            'img/dev/netflix/2.png',
            'img/dev/netflix/3.png',
        ]
    ],
    [
        'id' => 2,
        'titre' => 'YFNSM',
        'desc_courte' => 'Le premier devoir évalué du module WEB où le choix du sujet était libre, j\'ai donc choisi de créer un site web sur mon super héro préféré et son univers : Spider-Man. J\'y présente différents personnages, acteurs et films.',
        'date' => 'Janvier 2025',
        'lien' => 'projects/dev/spider/accueil.html',
        'photos' => [
            'img/dev/yfnsm/1.png',
            'img/dev/yfnsm/2.png',
            'img/dev/yfnsm/3.png',
            'img/dev/yfnsm/4.png',
            'img/dev/yfnsm/5.png',
        ]
    ],
    [
        'id' => 3,
        'titre' => 'Formula Drift',
        'desc_courte' => 'Ma première SAE (Situation d\'Apprentissage et d\'évaluation) du S1 où l\'utilisation de PHP/TWIG et MySQL était obligatoire. J\'ai, cette fois-ci, choisi de le faire sur la Formula Drift, une compétition de drift automobile en présentant des équipes et leurs pilotes, des circuits et des voitures adaptées.',
        'date' => 'Février 2025',
        'lien' => 'projects/dev/formula/index_fr.php',
        'photos' => [
            'img/dev/formula/1.png',
            'img/dev/formula/2.png',
            'img/dev/formula/3.png',
            'img/dev/formula/4.png'
        ]
    ],
    [
        'id' => 4,
        'titre' => '33 Tours',
        'desc_courte' => 'Deuxième SAE du S2, j\'ai décidé de faire un site web sur les vinyles avec différents artistes que j\'écoute régulièrement. J\'y ai intégré une base de données pour présenter une collection de vinyles, divers artistes et genres.',
        'date' => 'Mars 2025',
        'lien' => 'projects/dev/vinyle/index.php',
        'photos' => [
            'img/dev/vinyle/1.png',
            'img/dev/vinyle/2.png',
            'img/dev/vinyle/3.png',
            'img/dev/vinyle/4.png',
            'img/dev/vinyle/5.png',
            'img/dev/vinyle/6.png',
            'img/dev/vinyle/7.png',
            'img/dev/vinyle/8.png',
        ]
    ],
    [
        'id' => 5,
        'titre' => 'Archipelz',
        'desc_courte' => 'Dernière SAE de WEB du S4, j\'ai développé un site web sur les îles et archipels de la Polynésie française. Je me suis occupé de la partie front-end du projet en réalisant les maquettes et en intégrant les différentes pages du site tout en m\'inspirant de la direction artistique de Mario Sunshine.',
        'date' => 'Mars 2026',
        'lien' => 'projects/dev/archipelz/polynesie/templates/home.html.twig',
        'photos' => [
            'img/dev/archipelz/1.png',
            'img/dev/archipelz/2.png',
            'img/dev/archipelz/3.png',
            'img/dev/archipelz/4.png',
            'img/dev/archipelz/5.png',
            'img/dev/archipelz/6.png',
            'img/dev/archipelz/7.png',
        ]
    ],
    [
        'id' => 6,
        'titre' => 'Snake',
        'desc_courte' => 'Un rendu pour le module GAME où j\'ai réalisé une version du jeu Snake, j\'y ai intégré le mode de jeu classique, ainsi qu\'un mode Time Attack et Tunnels.',
        'date' => 'Avril 2026',
        'lien' => 'projects/dev/snake/index.html',
        'photos' => [
            'img/dev/snake/1.png',
            'img/dev/snake/2.png',
            'img/dev/snake/3.png',
        ]
    ],
];

$projects_game = [
    [
        'id' => 7,
        'titre' => 'I See You',
        'desc_courte' => 'Mon premier projet où j\'ai conçu un jeu vidéo avec 3 camarades. J\'ai pu modéliser l\'environnement de mon niveau et des items comme la lampe torche sur Blender, créer des scripts pour le fonctionnement de certaines actions et assembler le tout sur Unity.',
        'date' => 'Avril 2026',
        'lien' => [
            'projects/game/isy/webgl/index.html',
            'projects/game/isy/fbx/',
        ],
        // 'photos' => [
        //     'img/isy/1.png',
        //     'img/isy/2.png',
        //     'img/isy/3.png',
        // ]
    ],
    [
        'id' => 8,
        'titre' => 'Puit Low-Poly',
        'desc_courte' => 'Ce puit Low-Poly est mon premier objet 3D créé de A à Z via l\'aide d\'un tutoriel de la chaîne Grant Abbitt (Gabbitt). Grâce à celui-ci, j\'ai pu perfectionné mes acquis et en apprendre plus sur le logiciel Blender commme le shading des différents élements.',
        'date' => 'Juillet 2026',
        'lien' => 'projects/game/puit/#',
        'photos' => [
            'img/game/puit/puit.png',
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
