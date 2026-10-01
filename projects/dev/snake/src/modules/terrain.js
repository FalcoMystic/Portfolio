/** @Module Module Terrain */

export default class Terrain {
	constructor(l, h, ctx) {
		this.length = l;
		this.height = h;
		this.ctx = ctx;
		this.cellSize = 40;
		this.sol = [];
		for (let i = 0; i < this.length; i++) {
			this.sol[i] = [];
			for (let j = 0; j < this.height; j++) {
				this.sol[i][j] = 0;
			}
		}
	}

	draw() {
		// Couleurs de chaque type de cellule
		const colors = {
			0: '#CBE2B5', // Vide (vert)
			1: '#969696', // Rocher (gris)
			2: '#bd2323', // Pomme (rouge)
			// 3 = corps du serpent joueur pour collision
			4: '#ffa9ff', // Portail rose (TimeAttack seulement)
			5: '#94ffff', // Portail bleu (TimeAttack seulement)
			6: '#ffff93', // Portail jaune (TimeAttack seulement)
			7: '#A0714F', // Barrière (TimeAttack seulement)
		};

		for (let i = 0; i < this.length; i++) {
			for (let j = 0; j < this.height; j++) {
				// Obtenir la couleur selon le code de la cellule
				const cellCode = this.sol[i][j];
				this.ctx.fillStyle = colors[cellCode] || '#CBE2B5';  // Gris par défaut

				this.ctx.fillRect(
					i * this.cellSize,
					j * this.cellSize,
					this.cellSize,
					this.cellSize,
				);

				// Cadrillage du terrain
				this.ctx.strokeStyle = '#3a3a3a';
				this.ctx.lineWidth = 1;
				this.ctx.strokeRect(
					i * this.cellSize,
					j * this.cellSize,
					this.cellSize,
					this.cellSize,
				);
			}
		}
	}

	read(i, j) {
		if (i >= 0 && i < this.length && j >= 0 && j < this.height) {
			return this.sol[i][j];
		}
	}

	write(i, j, val) {
		if (i >= 0 && i < this.length && j >= 0 && j < this.height) {
			this.sol[i][j] = val;
		}
	}
}
