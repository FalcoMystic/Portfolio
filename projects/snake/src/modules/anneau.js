/** @Module Module Annneau */

// Classe Anneau
export default class Anneau {
	constructor(i, j, color, ctx, terrain) {
		this.i = i;
		this.j = j;
		this.color = color;
		this.cellSize = 40;
		this.ctx = ctx;
		this.terrain = terrain;
	}

	draw() {
		this.ctx.fillStyle = this.color;
		this.ctx.fillRect(
			this.i * this.cellSize,
			this.j * this.cellSize,
			this.cellSize,
			this.cellSize,
		);
	}

	move(d) {
		const nbLines = this.ctx.canvas.height / this.cellSize;
		const nbColumns = this.ctx.canvas.width / this.cellSize;
		switch (d) {
			case 0:
				this.j = (nbLines + this.j - 1) % nbLines;
				break;
			case 1:
				this.i = (nbColumns + this.i + 1) % nbColumns;
				break;
			case 2:
				this.j = (nbLines + this.j + 1) % nbLines;
				break;
			case 3:
				this.i = (nbColumns + this.i - 1) % nbColumns;
				break;
		}
	}

	copy(a) {
		this.i = a.i;
		this.j = a.j;
	}

	read(direction) {
		let i = this.i;
		let j = this.j;

		if (direction === 0) j--;
		if (direction === 1) i++;
		if (direction === 2) j++;
		if (direction === 3) i--;

		return this.terrain.read(i, j);
	}
}