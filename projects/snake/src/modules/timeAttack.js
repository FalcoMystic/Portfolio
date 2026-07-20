/** @Module Module Time Attack - Logique du mode Time Attack */

import { getRandomInt } from '../utils';

export default class TimeAttackManager {
    constructor() {
        // Configuration du mode Time Attack
        this.timeRemaining = 60;       // Durée limite en secondes
        this.targetApples = 30;        // Nombre de pommes à manger pour gagner
        this.gameStartTime = 0;        // Timestamp du démarrage (Date.now())
        this.appleCount = 0;           // Compteur de pommes mangées jusqu'à présent
    }

    // Démarrer une partie de Time Attack
    // Appelé une fois au début de la partie
    init() {
        this.timeRemaining = 60;
        this.gameStartTime = Date.now();  // Mémoriser l'heure de démarrage
        this.appleCount = 0;
    }

    // Mettre à jour le temps restant (appelé chaque frame)
    // Calcule combien de secondes se sont écoulées depuis le début
    update() {
        const timePassedSeconds = (Date.now() - this.gameStartTime) / 1000;
        this.timeRemaining = Math.max(0, 60 - Math.floor(timePassedSeconds));
        return this.timeRemaining;
    }

    // Vérifier si le temps est écoulé (0 secondes restantes)
    isTimeUp() {
        return this.timeRemaining === 0;
    }

    // Vérifier si le joueur a gagné (30 pommes mangées)
    isVictory() {
        return this.appleCount >= this.targetApples;
    }

    // Incrémenter le compteur de pommes quand le serpent en mange une
    addApple() {
        this.appleCount++;
    }

    // Getters pour afficher les valeurs dans l'interface
    getAppleCount() {
        return this.appleCount;
    }

    getTimeRemaining() {
        return this.timeRemaining;
    }

    getTargetApples() {
        return this.targetApples;
    }

    // Générer une pomme sur un bloc libre du terrain
    // Cherche une position aléatoire jusqu'à trouver un bloc vide (code 0)
    generateOneApple(terrain) {
        let randI = getRandomInt(20);
        let randJ = getRandomInt(20);

        // Boucle jusqu'à trouver une cellule libre
        while (terrain.read(randI, randJ) !== 0) {
            randI = getRandomInt(20);
            randJ = getRandomInt(20);
        }

        terrain.write(randI, randJ, 2);  // 2 = code de la pomme
    }
}
