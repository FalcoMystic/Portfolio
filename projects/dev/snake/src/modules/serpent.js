/** @Module Module Serpent */

import Anneau from './anneau';

export default class Serpent {
	constructor(length, i, j, direction, ctx, terrain, headColor, bodyColor , tailColor) {
		this.length = length;
		this.direction = direction;
		this.ctx = ctx;
		this.terrain = terrain;
		this.bodyColor = bodyColor;
		this.tailColor = tailColor;
		this.anneaux = [];
		// Remplissage du tableau d'anneaux
		for (let k = 0; k < this.length; k++) {
			this.anneaux.push(new Anneau(i, j, bodyColor, this.ctx, this.terrain));
		}
		// Modifie la couleur de l'anneau de tête
		this.anneaux[0].color = headColor;
		// Modifie la couleur de l'anneau de queue
		this.anneaux[length - 1].color = tailColor;
	}

	draw() {
		this.anneaux.forEach((anneau) => {
			anneau.draw();
		});
	}

	move() {
		// Lire la cellule devant la tête
		const cellValue = this.anneaux[0].read(this.direction);

		// Décider selon la valeur
		if (cellValue === 0) {
			// Libre : déplacer
			this.moveForward();
		} else {
			// Collision/bordure/rocher : changer de direction
			this.direction = (this.direction + 1) % 4;
		}
	}

	moveForward() {
		// Mémoriser la queue avant de copier
		const tailI = this.anneaux[this.length - 1].i;
		const tailJ = this.anneaux[this.length - 1].j;

		for (let k = this.length - 1; k > 0; k--) {
			this.anneaux[k].copy(this.anneaux[k - 1]);
		}
		this.anneaux[0].move(this.direction);

		// Écrire 3 (corps) à la tête - sauf si c'est un portail (codes 4, 5, 6)
		const headValue = this.terrain.read(this.anneaux[0].i, this.anneaux[0].j);
		if (!(headValue >= 4 && headValue <= 6)) {
			this.terrain.write(this.anneaux[0].i, this.anneaux[0].j, 3);
		}

		// Écrire 0 (libre) à la queue - sauf si c'est un portail
		const tailValue = this.terrain.read(tailI, tailJ);
		if (!(tailValue >= 4 && tailValue <= 6)) {
			this.terrain.write(tailI, tailJ, 0);
		}
	}

	extend() {
		// L'anneau de queue actuel devient un anneau de corps
		this.anneaux[this.length - 1].color = this.bodyColor;

		// On ajoute un anneau supplémentaire au serpent à la position de l'ancienne queue
		const newAnneau = new Anneau(
			this.anneaux[this.length - 1].i,
			this.anneaux[this.length - 1].j,
			this.tailColor,
			this.ctx,
			this.terrain
		);
		this.anneaux.push(newAnneau);
		this.length++;
	}

	changeDir(d) {
		this.direction = d;
	}
}
