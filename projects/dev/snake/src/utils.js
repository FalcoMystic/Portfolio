/**
 * Fonctions utiles
 * @module utils
 */

/**
 * Fonction générant des nombres pseudo-aléatoires entiers
 * entre 0 et max (max non compris)
 * @param {*} max Valeur max entière (non comprise)
 * @returns Valeur aléatoire dans [0, max)
 */
function getRandomInt(max) {
	return Math.floor(Math.random() * max);
}

export { getRandomInt };
