/** @Module Module Tunnels - Logique des portails et des sections */

import { getRandomInt } from '../utils';

export default class TunnelManager {
    constructor(terrain) {
        this.terrain = terrain;
        this.tunnelPairs = [];  // Contient les paires de portails reliés
    }

    // Générer le mode Tunnels : 3 sections séparées par des barrières avec des portails
    generate() {
        this.tunnelPairs = [];

        // 3 sections verticales du terrain
        // Section 0 : lignes 0-6  (zone du haut)
        // Section 1 : lignes 7-13 (zone du milieu)
        // Section 2 : lignes 14-19 (zone du bas)
        const sections = [
            { start: 0, end: 6 },
            { start: 7, end: 13 },
            { start: 14, end: 19 }
        ];

        // Générer les barrières qui empêchent le déplacement direct entre sections
        this.generateBarriers();

        // Codes des portails : 4=rose, 5=bleu, 6=jaune
        // Ces codes permettent de différencier les portails et leurs connexions
        const leftCodes = [4, 5, 6];   // Portails gauche : rose, bleu, jaune (de haut en bas)
        const rightCodes = [6, 4, 5];  // Portails droite : jaune, rose, bleu (de haut en bas)

        // Placer les portails au centre de chaque section
        for (let sectionIdx = 0; sectionIdx < sections.length; sectionIdx++) {
            const section = sections[sectionIdx];

            // Calculer le centre vertical de la section
            const centerY = Math.floor((section.start + section.end) / 2);

            // Récupérer les codes des portails pour cette section
            const leftCode = leftCodes[sectionIdx];
            const rightCode = rightCodes[sectionIdx];

            // Placer les portails aux extrémités gauche (i=0) et droite (i=19)
            this.terrain.write(0, centerY, leftCode);     // Portail gauche
            this.terrain.write(19, centerY, rightCode);   // Portail droite
        }

        // Créer les connexions entre les portails de même couleur
        this.createPortalConnections();
    }

    // Créer les paires de portails qui se téléportent
    // Les portails de même couleur sont connectés entre eux
    createPortalConnections() {
        this.tunnelPairs = [];

        // Chercher tous les portails sur le terrain (codes 4, 5, 6)
        const portals = { 4: [], 5: [], 6: [] };

        // Scanner tout le terrain pour trouver les portails
        for (let i = 0; i < 20; i++) {
            for (let j = 0; j < 20; j++) {
                const cellValue = this.terrain.read(i, j);
                if (cellValue >= 4 && cellValue <= 6) {
                    // Mémoriser la position de ce portail
                    portals[cellValue].push({ i, j });
                }
            }
        }

        // Créer les paires : les deux portails de même couleur se connectent
        // Cela crée un système de téléportation : entrer par un côté, sortir de l'autre
        for (let code = 4; code <= 6; code++) {
            if (portals[code].length >= 2) {
                this.tunnelPairs.push({
                    entry: portals[code][0],  // Premier portail (gauche)
                    exit: portals[code][1],   // Deuxième portail (droite)
                    code: code
                });
            }
        }
    }

    // Vérifier et traiter la téléportation quand le serpent entre dans un portail
    checkTeleport(serpentHead, direction) {
        const nextCell = serpentHead.read(direction);
        const isPortal = nextCell >= 4 && nextCell <= 6;

        if (!isPortal) return false;

        // Trouver la paire de portails correspondants
        const tunnelPair = this.tunnelPairs.find(t => t.code === nextCell);
        if (!tunnelPair) return false;

        // Calculer la prochaine position du serpent
        const nextI = serpentHead.i + (direction === 1 ? 1 : direction === 3 ? -1 : 0);
        const nextJ = serpentHead.j + (direction === 2 ? 1 : direction === 0 ? -1 : 0);

        // Vérifier si on rentre dans l'entrée ou la sortie du portail
        const isAtEntry = nextI === tunnelPair.entry.i && nextJ === tunnelPair.entry.j;
        const isAtExit = nextI === tunnelPair.exit.i && nextJ === tunnelPair.exit.j;

        if (isAtEntry || isAtExit) {
            // Sauver l'ancienne position avant la téléportation
            const oldI = serpentHead.i;
            const oldJ = serpentHead.j;

            // Téléporter le serpent à la destination
            if (isAtEntry) {
                // Entrer par la première extrémité, sortir par la deuxième
                serpentHead.i = tunnelPair.exit.i;
                serpentHead.j = tunnelPair.exit.j;
            } else {
                // Entrer par la deuxième extrémité, sortir par la première
                serpentHead.i = tunnelPair.entry.i;
                serpentHead.j = tunnelPair.entry.j;
            }

            // Nettoyer l'ancienne position pour éviter les blocs de collision invisibles
            if (this.terrain.read(oldI, oldJ) === 3) {  // 3 = code du corps du serpent
                this.terrain.write(oldI, oldJ, 0);  // Effacer et laisser du vide (0)
            }

            return true;  // Signal que la téléportation a eu lieu
        }

        return false;
    }

    // Générer les barrières entre les sections
    // Cela crée des limites impassables sauf par les portails
    generateBarriers() {
        // Barrière entre section 1 et 2 (à j=6)
        // Crée une ligne continue de rochers qui bloque le passage
        for (let i = 0; i < 20; i++) {
            this.terrain.write(i, 6, 7);  // 7 = code de la barrière
        }

        // Barrière entre section 2 et 3 (à j=13)
        for (let i = 0; i < 20; i++) {
            this.terrain.write(i, 13, 7);
        }
    }
}
