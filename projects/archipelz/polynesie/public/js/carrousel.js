/**
 * Fonction créant un slideshow
 * @param {string} contentId : valeur d'id du conteneur des slides
 */
function createSlideshow(contentId) {
	const content = document.querySelector("#" + contentId);
	const slides = Array.from(content.children);

	slides.forEach((slide) => {
		//console.log(slide);
		// L'utilisation de la propriété CSS "visbility" n'est pas adaptée ici :
		// elle réserve un espace pour la div de la slide, ce qu'on ne veut pas !
		//slide.style.visibility = "hidden";
		// 1ère possibilité : utiliser la propriété CSS "display"
		//slide.style.display = "none";
		// 2ème possibilité : utiliser l'attribut HTML "hidden"
		// "hidden" permet de masquer ou afficher un élément indépendamment
		// du CSS qui s'applique sur cet élément
		slide.hidden = true;
		slide.classList.add("fade");
	});

	slides[0].hidden = false;

	const content1 = document.getElementById(contentId);
	content1.style.position = "relative";

	// Création du bouton de commande "précédent"
	const buttonPrev = document.createElement("button");
	content1.appendChild(buttonPrev);
	buttonPrev.classList.add("carousel__prev");

	// Création du bouton de commande "suivant"
	const buttonNext = document.createElement("button");
	content1.appendChild(buttonNext);
	buttonNext.classList.add("carousel__next");

	content1.hidden = false;

	// Index de la slide visible
	let index = 0;

	buttonPrev.addEventListener("click", (event) => {
		slides[index].hidden = true;
		// 2ème possibilité
		index = (slides.length + index - 1) % slides.length;
		slides[index].hidden = false;
	});

	buttonNext.addEventListener("click", (event) => {
		slides[index].hidden = true;
		// 2ème possibilité avec l'opérateur modulo (%)
		index = (index + 1) % slides.length;

		slides[index].hidden = false;
	});
}

// Appels à la fonction createSlideshow pour créer
createSlideshow("content1");

