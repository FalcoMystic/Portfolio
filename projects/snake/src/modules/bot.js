/** @Module Module Bot - Gestion des serpents autonomes (IA) */

import Serpent from './serpent';
import { getRandomInt } from '../utils';

export default class BotManager {
    constructor(ctx, terrain) {
        this.ctx = ctx;
        this.terrain = terrain;
        this.bots = [];  // Liste des serpents autonomes
    }

    // Créer les serpents autonomes avec IA basique
    // Ces serpents se déplacent automatiquement et changent aléatoirement de direction
    createBots() {
        this.bots = [];

        // Bot 1 : rouge, commence au centre (10,10), direction bas (2)
        const bot1 = new Serpent(5, 10, 10, 2,
            this.ctx, this.terrain,
            '#E24A4A', '#FF9999', '#FFCCCC');

        // Bot 2 : rouge, commence en bas à droite (15,15), direction haut (0)
        const bot2 = new Serpent(5, 15, 15, 0,
            this.ctx, this.terrain,
            '#E24A4A', '#FF9999', '#FFCCCC');

        this.bots.push(bot1, bot2);
    }

    // Mettre à jour les bots (appelé chaque frame)
    // Applique l'IA simple et affiche les bots
    update() {
        for (let bot of this.bots) {
            // IA simple : 30% de chance de changer de direction
            // Cela crée une apparence "aléatoire" tout en gardant une certaine fluidité
            if (getRandomInt(10) < 3) {
                // Choisir une direction aléatoire : 0=haut, 1=droite, 2=bas, 3=gauche
                bot.direction = getRandomInt(4);
            }

            // Exécuter le mouvement du bot
            bot.move();
            // Afficher le bot à sa nouvelle position
            bot.draw();
        }
    }
}
