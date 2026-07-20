let selectedMarkerIds = [];
let selectedMarkers = {};
const markersData = window.markersData ?? [];

function updateSelectedMarkersInput() {
    // Met à jour UNIQUEMENT le champ caché, sans toucher au DOM
    const markersPayload = selectedMarkerIds.map(id => ({
        id,
        title: document.getElementById(`title_${id}`)?.value ?? '',
        custom_description: document.getElementById(`desc_${id}`)?.value ?? '',
    }));
    document.getElementById('selected_markers').value = JSON.stringify(markersPayload);
}

function addMarkerToList(m) {
    const liste = document.getElementById('liste-markers');
    document.getElementById('compteur').textContent = selectedMarkerIds.length;

    const li = document.createElement('li');
    li.id = `li_marker_${m.id}`;
    li.dataset.id = m.id; // important pour récupérer l'ordre après drag
    li.innerHTML = `
        <span class="drag-handle" style="cursor:grab; margin-right:8px;">☰</span>
        <strong>${m.title}</strong>
        <input type="text" id="title_${m.id}" placeholder="Titre personnalisé" value="">
        <textarea id="desc_${m.id}" placeholder="Description personnalisée"></textarea>
        <button type="button" onclick="toggleMarker(${m.id}, window._gmMarkers[${m.id}])">✕</button>
    `;

    li.querySelector(`#title_${m.id}`).addEventListener('input', updateSelectedMarkersInput);
    li.querySelector(`#desc_${m.id}`).addEventListener('input', updateSelectedMarkersInput);

    liste.appendChild(li);
}

function removeMarkerFromList(id) {
    const li = document.getElementById(`li_marker_${id}`);
    if (li) li.remove();
    document.getElementById('compteur').textContent = selectedMarkerIds.length;
}

function toggleMarker(id, gmMarker) {
    const index = selectedMarkerIds.indexOf(id);
    if (index === -1) {
        selectedMarkerIds.push(id);
        selectedMarkers[id] = markersData.find(m => m.id === id);
        if (gmMarker) gmMarker.setIcon('https://maps.google.com/mapfiles/ms/icons/blue-dot.png');
        addMarkerToList(selectedMarkers[id]);
    } else {
        selectedMarkerIds.splice(index, 1);
        delete selectedMarkers[id];
        if (gmMarker) gmMarker.setIcon(null);
        removeMarkerFromList(id);
    }
    updateSelectedMarkersInput();
}

// Initialiser le drag and drop sur la liste
function initSortable() {
    const liste = document.getElementById('liste-markers');
    Sortable.create(liste, {
        animation: 150,
        handle: '.drag-handle', // poignée de drag
        onEnd: () => {
            // Reconstruire selectedMarkerIds dans le nouvel ordre
            const items = document.querySelectorAll('#liste-markers li');
            selectedMarkerIds = Array.from(items).map(li => parseInt(li.dataset.id));
            updateSelectedMarkersInput();
        }
    });
}

function initMap() {
    const tahiti = { lat: -17.650920, lng: -149.426042 };
    const map = new google.maps.Map(document.getElementById('carte'), {
        center: tahiti,
        zoom: 8
    });

    const infoWindow = new google.maps.InfoWindow();

    markersData.forEach(m => {
        const gmMarker = new google.maps.Marker({
            position: { lat: m.lat, lng: m.lng },
            map: map,
            title: m.title,
        });

        gmMarker.addListener('click', () => {
            const contenu = `
                <div style="max-width:220px; font-family:sans-serif;">
                    ${m.photo ? `<img src="${m.photo}" style="width:100%; border-radius:6px; margin-bottom:8px;">` : ''}
                    <strong>${m.title}</strong>
                    <button onclick="toggleMarker(${m.id}, window._gmMarkers[${m.id}])">
                        ${selectedMarkerIds.includes(m.id) ? 'Retirer du parcours' : 'Ajouter au parcours'}
                    </button>
                </div>
            `;
            infoWindow.setContent(contenu);
            infoWindow.open(map, gmMarker);
        });

        window._gmMarkers = window._gmMarkers || {};
        window._gmMarkers[m.id] = gmMarker;
    });
}


// Appeler initSortable une seule fois au chargement
document.addEventListener('DOMContentLoaded', initSortable);