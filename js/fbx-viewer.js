// Attend que le HTML soit chargé avant de chercher le visualiseur.
document.addEventListener('DOMContentLoaded', () => {
	// Récupère le conteneur créé dans detail-project.twig.
	const viewer = document.querySelector('.model-viewer');

	if (!viewer) {
		return;
	}

	const canvas = viewer.querySelector('canvas');
	// data-model contient le chemin vers le fichier .fbx.
	const modelPath = viewer.dataset.model;
	// Ces éléments servent à ouvrir et fermer la fenêtre modale.
	const modal = document.querySelector('.model-viewer-modal');
	const openButton = document.querySelector('[data-open-model-viewer]');
	const closeButton = modal?.querySelector('.model-viewer-close');

	// Vérifie que Three.js et ses deux extensions ont bien été chargés.
	if (!window.THREE || !THREE.FBXLoader || !THREE.OrbitControls) {
		viewer.querySelector('.model-viewer-status').textContent =
			'Le visualiseur 3D est indisponible.';
		return;
	}

	// La scène contient tout ce qui sera dessiné : modèle, caméra et lumières.
	const scene = new THREE.Scene();
	scene.background = new THREE.Color(0x1d1d1d);
	// La caméra observe la scène. 15 est la focale, les deux autres valeurs
	// définissent les distances minimale et maximale visibles.
	const camera = new THREE.PerspectiveCamera(15, 1, 0.1, 2000);
	// Le renderer transforme la scène 3D en image dans le canvas HTML.
	const renderer = new THREE.WebGLRenderer({
		canvas,
		antialias: true,
		alpha: true,
	});
	// OrbitControls permet de tourner autour du modèle et de zoomer.
	const controls = new THREE.OrbitControls(camera, renderer.domElement);
	// Une lumière ambiante éclaire légèrement toutes les faces.
	const ambientLight = new THREE.AmbientLight(0xffffff, 0.5);
	// La lumière principale vient du dessus et de la droite.
	const keyLight = new THREE.DirectionalLight(0xffffff, 2.2);
	// La lumière secondaire adoucit les zones trop sombres.
	const fillLight = new THREE.DirectionalLight(0xffffff, 0.8);

	// Adapte la netteté à l'écran sans dépasser deux fois sa résolution.
	renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
	// Ces réglages contrôlent la façon dont les couleurs sont affichées.
	renderer.outputEncoding = THREE.sRGBEncoding;
	renderer.toneMapping = THREE.ACESFilmicToneMapping;
	renderer.toneMappingExposure = 0.8;
	scene.add(ambientLight, keyLight, fillLight);
	// La position d'une DirectionalLight indique la direction de ses rayons.
	keyLight.position.set(14, 12, 6);
	fillLight.position.set(-4, 5, -5);
	// Position initiale de la caméra : X, Y, Z.
	camera.position.set(-3, 1, 4);
	controls.enableDamping = true;
	controls.dampingFactor = 0.06;
	controls.minDistance = 1;
	controls.maxDistance = 5;

	// Maintient le bon rapport largeur/hauteur quand la fenêtre change de taille.
	const resize = () => {
		const { width, height } = viewer.getBoundingClientRect();
		camera.aspect = width / height;
		camera.updateProjectionMatrix();
		renderer.setSize(width, height, false);
	};

	resize();
	window.addEventListener('resize', resize);

	// Ouvre ou ferme la grande fenêtre contenant le modèle 3D.
	const setModalState = (isOpen) => {
		if (!modal) {
			return;
		}

		modal.classList.toggle('is-open', isOpen);
		modal.setAttribute('aria-hidden', String(!isOpen));
		document.body.classList.toggle('model-viewer-modal-open', isOpen);

		if (isOpen) {
			requestAnimationFrame(resize);
			closeButton?.focus();
		} else {
			openButton?.focus();
		}
	};

	// Le bouton conserve son style : on intercepte seulement son lien.
	openButton?.addEventListener('click', (event) => {
		event.preventDefault();
		setModalState(true);
	});
	closeButton?.addEventListener('click', () => setModalState(false));
	modal?.addEventListener('click', (event) => {
		if (event.target === modal) {
			setModalState(false);
		}
	});
	document.addEventListener('keydown', (event) => {
		if (event.key === 'Escape' && modal?.classList.contains('is-open')) {
			setModalState(false);
		}
	});

	// Charge le fichier FBX de manière asynchrone.
	new THREE.FBXLoader().load(
		modelPath,
		(model) => {
			// Calcule la taille et le centre réels du modèle importé.
			const box = new THREE.Box3().setFromObject(model);
			const size = box.getSize(new THREE.Vector3());
			const center = box.getCenter(new THREE.Vector3());
			const largestSide = Math.max(size.x, size.y, size.z);
			// Ramène le plus grand côté du modèle à une taille de référence de 1.
			const scale = 1 / largestSide;

			model.scale.setScalar(scale);
			// Centre le modèle sur les trois axes, puis le relève légèrement.
			model.position.sub(center.multiplyScalar(scale));
			model.position.y += 0.2;
			model.traverse((child) => {
				if (child.isMesh) {
					// Un FBX peut contenir plusieurs matériaux sur un même objet.
					const materials = Array.isArray(child.material)
						? child.material
						: [child.material];

					materials.forEach((material) => {
						// Affiche les faces séparément pour conserver l'aspect low-poly.
						material.flatShading = true;
						material.needsUpdate = true;
					});
					// Prépare les maillages à recevoir des ombres si elles sont activées.
					child.castShadow = true;
					child.receiveShadow = true;
				}
			});

			scene.add(model);
			controls.target.set(0, 0.2, 0);
			controls.update();
			viewer.classList.add('is-ready');
		},
		undefined,
		() => {
			viewer.querySelector('.model-viewer-status').textContent =
				'Impossible de charger le modèle 3D.';
		},
	);

	// Boucle de rendu : elle redessine la scène à chaque image.
	const animate = () => {
		requestAnimationFrame(animate);
		controls.update();
		renderer.render(scene, camera);
	};

	animate();
});
