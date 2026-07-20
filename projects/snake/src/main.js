import "./style.css";
import Terrain from './modules/terrain';
import Serpent from './modules/serpent';
import BotManager from './modules/bot';
import TunnelManager from './modules/tunnels';
import TimeAttackManager from './modules/timeAttack';
import { getRandomInt } from './utils';

// Initialiser le canvas et son contexte de dessin
let canvas = document.getElementById('terrain');
let ctx = canvas.getContext('2d');

// === CONSTANTES ===
// Configuration du FPS et de la taille du terrain
const TERRAIN_SIZE = 20;
const MAX_FPS = 10;
const FRAME_INTERVAL = 1000 / MAX_FPS;

// Codes des cellules du terrain (chaque cellule peut contenir un type d'objet)
const EMPTY = 0;         // Bloc vide (vert)
const ROCK = 1;          // Rocher = obstacle (collision)
const APPLE = 2;         // Pomme = objectif à manger
const SNAKE_BODY = 3;    // Corps du serpent = collision
// const PORTAL = [4, 5, 6]; | Portails = téléportation (codes 4=rose, 5=bleu, 6=jaune) - Testé avec des conditions directes
const BARRIER = 7;       // Barrière = obstacle séparant les sections (collision)

// === VARIABLES GLOBALES ===
// État du jeu
let gameMode = null;           // Mode actuel : 'normal', 'tunnels', ou 'timeAttack'
let animationTimer = 0;        // ID de la frame d'animation pour pouvoir l'arrêter
let starttime = 0;             // Timestamp de démarrage de la frame (pour FPS stable)
let totalScore = 0;            // Score total (nombre de pommes mangées depuis le début)
let terrain = null;            // Instance du terrain (grille 20x20)
let serpent1 = null;           // Instance du serpent du joueur
let applesEaten = 0;           // Compteur de pommes mangées dans cette vague

// Managers = classes qui gèrent des systèmes spécifiques
let botManager = null;         // Gère les serpents autonomes (IA)
let tunnelManager = null;      // Gère les portails et les barrières
let timeAttackManager = null;  // Gère le timer et l'objectif de pommes

// === FONCTIONS UTILITAIRES ===

// Générer les rochers aléatoires sur le terrain
// Crée des obstacles immobiles pour compliquer le jeu
function generateRocks(count = 10) {
    for (let i = 0; i < count; i++) {
        let randI = getRandomInt(TERRAIN_SIZE);
        let randJ = getRandomInt(TERRAIN_SIZE);
        terrain.write(randI, randJ, ROCK);  // Écrire le code 1 (rocher)
    }
}

// Générer les pommes aléatoires sur le terrain
// Cherche à placer chaque pomme sur un bloc VIDE seulement
function generateApples(count = 3) {
    const applesArray = [];

    for (let i = 0; i < count; i++) {
        let randI = getRandomInt(TERRAIN_SIZE);
        let randJ = getRandomInt(TERRAIN_SIZE);

        // Boucle jusqu'à trouver une cellule vide (code 0)
        // Cela évite de placer une pomme sur un rocher, portail, ou barrière
        while (terrain.read(randI, randJ) !== EMPTY) {
            randI = getRandomInt(TERRAIN_SIZE);
            randJ = getRandomInt(TERRAIN_SIZE);
        }

        terrain.write(randI, randJ, APPLE);  // Écrire le code 2 (pomme)
        applesArray.push({ i: randI, j: randJ });
    }

    return applesArray;
}

// === INITIALISATION DU JEU ===

// Initialiser une partie selon le mode choisi
function initGame(mode) {
    gameMode = mode;

    // Afficher l'écran de jeu
    document.getElementById('menu').style.display = 'none';
    document.getElementById('gameScreen').style.display = 'block';

    // Afficher/cacher les éléments selon le mode
    const showTimer = (mode === 'timeAttack');
    document.getElementById('timer').style.display = showTimer ? 'block' : 'none';
    document.getElementById('collectibles').style.display = showTimer ? 'block' : 'none';

    // Réinitialiser les variables
    animationTimer = 0;
    starttime = 0;
    totalScore = 0;
    applesEaten = 0;

    document.getElementById('score').textContent = 'Score: 0';
    document.getElementById('gameOver').textContent = 'Partie perdue';
    document.getElementById('gameOver').style.display = 'none';
    document.getElementById('buttonContainer').style.display = 'none';

    // Créer et dessiner le terrain
    terrain = new Terrain(TERRAIN_SIZE, TERRAIN_SIZE, ctx);
    terrain.draw();

    // Générer les obstacles
    generateRocks(10);

    // Initialiser les managers
    botManager = new BotManager(ctx, terrain);
    tunnelManager = new TunnelManager(terrain);
    timeAttackManager = new TimeAttackManager();

    // Générer les éléments du mode Tunnels AVANT les pommes
    if (mode === 'tunnels') {
        tunnelManager.generate();
    } else {
        // Créer les bots pour les autres modes
        botManager.createBots();
    }

    // Générer les pommes
    if (mode === 'timeAttack') {
        generateApples(10);
        timeAttackManager.init();
    } else {
        generateApples(3);
    }

    // Créer le serpent du joueur
    serpent1 = new Serpent(3, 5, 3, 1, ctx, terrain, '#4A90E2', '#7CB3FF', '#B3D9FF');

    // Démarrer le jeu
    setupKeyboardControls();
    startRAF();
}

// === CONTRÔLES ===

// Configurer l'écoute des touches clavier
function setupKeyboardControls() {
    document.removeEventListener('keydown', handleKeydown);
    document.addEventListener('keydown', handleKeydown);
}

// Gérer les touches de flèches
function handleKeydown(event) {
    switch (event.key) {
        case 'ArrowUp':
            if (serpent1.direction !== 2) serpent1.direction = 0;  // Haut
            break;
        case 'ArrowRight':
            if (serpent1.direction !== 3) serpent1.direction = 1;  // Droite
            break;
        case 'ArrowDown':
            if (serpent1.direction !== 0) serpent1.direction = 2;  // Bas
            break;
        case 'ArrowLeft':
            if (serpent1.direction !== 1) serpent1.direction = 3;  // Gauche
            break;
    }
}

// === EVENT LISTENERS ===

// Boutons du menu
document.getElementById('modeNormal').addEventListener('click', () => initGame('normal'));
document.getElementById('modeTunnels').addEventListener('click', () => initGame('tunnels'));
document.getElementById('modeTimeAttack').addEventListener('click', () => initGame('timeAttack'));

// Bouton Rejouer
document.getElementById('restartBtn').addEventListener('click', () => {
    cancelAnimationFrame(animationTimer);
    initGame(gameMode);
});

// Bouton Menu
document.getElementById('menuBtn').addEventListener('click', () => {
    cancelAnimationFrame(animationTimer);
    document.getElementById('gameScreen').style.display = 'none';
    document.getElementById('menu').style.display = 'block';
});

// === BOUCLE D'ANIMATION ===

// Fonction pour démarrer la boucle d'animation
function startRAF(timestamp = 0) {
    animationTimer = requestAnimationFrame(startRAF);

    if (starttime === 0) starttime = timestamp;

    let delta = timestamp - starttime;
    if (delta >= FRAME_INTERVAL) {
        anim();
        starttime = timestamp - (delta % FRAME_INTERVAL);
    }
}

// Mettre à jour et dessiner chaque frame
function anim() {
    // === ÉTAPE 1 : Mettre à jour le Time Attack ===
    if (gameMode === 'timeAttack') {
        // Calculer le temps restant et mettre à jour l'affichage
        timeAttackManager.update();
        document.getElementById('timer').textContent = `Temps: ${timeAttackManager.getTimeRemaining()}`;
        document.getElementById('collectibles').textContent = `Collectibles: ${timeAttackManager.getAppleCount()}/${timeAttackManager.getTargetApples()}`;

        // Vérifier si le temps est écoulé
        if (timeAttackManager.isTimeUp()) {
            const message = timeAttackManager.isVictory() ? 'Victoire !' : 'Temps écoulé !';
            document.getElementById('gameOver').textContent = message;
            endGame();
            return;  // Arrêter la boucle
        }
    }

    // === ÉTAPE 2 : Redessiner le terrain ===
    ctx.fillRect(0, 0, canvas.width, canvas.height);  // Effacer l'écran
    terrain.draw();  // Redessiner toutes les cellules

    // === ÉTAPE 3 : Vérifier les collisions et déplacer le serpent ===
    // Lire la cellule vers laquelle va se diriger le serpent
    const nextCell = serpent1.anneaux[0].read(serpent1.direction);
    // Précompiler les collisions pour éviter les vérifications redondantes
    const isCollision = nextCell === ROCK || nextCell === SNAKE_BODY || nextCell === BARRIER;

    if (gameMode === 'tunnels') {
        // === MODE TUNNELS : Gestion des portails ===
        if (tunnelManager.checkTeleport(serpent1.anneaux[0], serpent1.direction)) {
            // Le serpent rentre dans un portail et est téléporté
            // Au prochain appel de anim(), il bougera normalement depuis sa nouvelle position
        } else if (nextCell === APPLE) {
            handleAppleCollision();
        } else if (isCollision || nextCell === undefined) {
            endGame();
        } else {
            serpent1.move();  // Bouger le serpent normalement
        }
    } else {
        // === MODE NORMAL ET TIME ATTACK ===
        if (nextCell === APPLE) {
            handleAppleCollision();
        } else if (isCollision || nextCell === undefined) {
            endGame();
        } else {
            serpent1.move();  // Bouger le serpent normalement
        }
    }

    // === ÉTAPE 4 : Afficher les objets ===
    serpent1.draw();  // Redessiner le serpent à sa nouvelle position

    // Mettre à jour les bots (sauf en mode Tunnels)
    if (gameMode !== 'tunnels') {
        botManager.update();  // Mettre les bots en mouvement avec IA
    }
}

// === GESTION DES COLLISIONS ===

// Quand le serpent mange une pomme : croître et générer une nouvelle pomme
function handleAppleCollision() {
    const headI = serpent1.anneaux[0].i;
    const headJ = serpent1.anneaux[0].j;

    // Avancer le serpent et ajouter un anneau (croissance)
    serpent1.moveForward();
    serpent1.extend();

    // Effacer la pomme mangée du terrain
    terrain.write(headI, headJ, EMPTY);

    // Mettre à jour les scores
    totalScore++;
    applesEaten++;
    document.getElementById('score').textContent = `Score: ${totalScore}`;

    // === Générer une nouvelle pomme selon le mode ===
    if (gameMode === 'timeAttack') {
        timeAttackManager.addApple();

        // Vérifier si on a atteint l'objectif (30 pommes)
        if (timeAttackManager.isVictory()) {
            document.getElementById('gameOver').textContent = 'Victoire !';
            endGame();
            return;
        }

        // Générer une pomme immédiatement
        timeAttackManager.generateOneApple(terrain);
    } else {
        // Mode Normal et Tunnels : générer 3 pommes après en avoir mangé 3
        // Cela crée des "vagues" de pommes pour varier le jeu
        if (applesEaten >= 3) {
            generateApples(3);
            applesEaten = 0;
        }
    }
}

// Terminer la partie (Game Over)
function endGame() {
    document.getElementById('gameOver').style.display = 'block';
    document.getElementById('buttonContainer').style.display = 'flex';
    cancelAnimationFrame(animationTimer);
}