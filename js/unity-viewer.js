// Attend que la page soit chargée avant de chercher les éléments HTML.
document.addEventListener('DOMContentLoaded', () => {
	// Récupère la modale Unity, le bouton d'ouverture et le bouton de fermeture.
	const modal = document.querySelector('.unity-game-modal');
	const openButton = document.querySelector('[data-open-unity-game]');
	const closeButton = modal?.querySelector('.unity-game-close');
	const gameFrame = modal?.querySelector('.unity-game');
	const fullscreenButton = modal?.querySelector('.unity-game-fullscreen');

	if (!modal || !openButton) {
		return;
	}

	// Centralise l'ouverture et la fermeture de la fenêtre du jeu.
	const setModalState = (isOpen) => {
		// La classe is-open rend la modale visible grâce au CSS.
		modal.classList.toggle('is-open', isOpen);
		// aria-hidden informe les technologies d'assistance de l'état de la modale.
		modal.setAttribute('aria-hidden', String(!isOpen));
		// Empêche la page située derrière la modale de défiler.
		document.body.classList.toggle('model-viewer-modal-open', isOpen);

		if (isOpen) {
			// Place le curseur sur la fermeture quand la modale s'ouvre.
			closeButton?.focus();
		} else {
			// Rend le curseur au bouton qui a ouvert la modale.
			openButton.focus();
		}
	};

	// Le bouton est un lien à l'origine : preventDefault évite de naviguer vers #.
	openButton.addEventListener('click', (event) => {
		event.preventDefault();
		setModalState(true);
	});

	// Ferme la modale quand l'utilisateur clique sur le bouton ×.
	closeButton?.addEventListener('click', () => setModalState(false));

	fullscreenButton?.addEventListener('click', () => {
		gameFrame?.requestFullscreen?.();
	});

	// Un clic sur le fond ferme la modale, mais pas un clic dans le jeu.
	modal.addEventListener('click', (event) => {
		if (event.target === modal) {
			setModalState(false);
		}
	});

	// Permet de fermer rapidement la fenêtre avec la touche Échap.
	document.addEventListener('keydown', (event) => {
		if (event.key === 'Escape' && modal.classList.contains('is-open')) {
			setModalState(false);
		}
	});
});
