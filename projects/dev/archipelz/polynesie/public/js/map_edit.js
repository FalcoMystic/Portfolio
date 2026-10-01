let selectedMarkerIds = [];
let selectedMarkers = {};
const markersData = window.markersData ?? [];
const existingMarkerIds = window.existingMarkerIds ?? [];

// Pré-remplir les markers existants au chargement
document.addEventListener('DOMContentLoaded', () => {
    initSortable();

    // Ajouter les markers déjà associés au parcours
    existingMarkerIds.forEach(id => {
        const m = markersData.find(m => m.id === id);
        if (m) {
            selectedMarkerIds.push(id);
            selectedMarkers[id] = m;
            addMarkerToList(m);
        }
    });

    updateSelectedMarkersInput();
});

// Le reste est identique à map_add.js
function updateSelectedMarkersInput() {
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
    li.dataset.id = m.id;
    li.innerHTML = `
        <span class="drag-handle" style="cursor:grab; margin-right:8px;"><svg xmlns='http://www.w3.org/2000/svg' width='50' height='50' viewBox='0 0 24 24'><title>menu_line</title><g id="menu_line" fill='none'><path d='M24 0v24H0V0zM12.593 23.258l-.011.002-.071.035-.02.004-.014-.004-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01-.017.428.005.02.01.013.104.074.015.004.012-.004.104-.074.012-.016.004-.017-.017-.427c-.002-.01-.009-.017-.017-.018m.265-.113-.013.002-.185.093-.01.01-.003.011.018.43.005.012.008.007.201.093c.012.004.023 0 .029-.008l.004-.014-.034-.614c-.003-.012-.01-.02-.02-.022m-.715.002a.023.023 0 0 0-.027.006l-.006.014-.034.614c0 .012.007.02.017.024l.015-.002.201-.093.01-.008.004-.011.017-.43-.003-.012-.01-.01z'/><path fill='rgb(0, 0, 0)' d='M20 18a1 1 0 0 1 .117 1.993L20 20H4a1 1 0 0 1-.117-1.993L4 18zm0-7a1 1 0 1 1 0 2H4a1 1 0 1 1 0-2zm0-7a1 1 0 1 1 0 2H4a1 1 0 0 1 0-2z'/></g></svg></span>
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

function initSortable() {
    const liste = document.getElementById('liste-markers');
    Sortable.create(liste, {
        animation: 150,
        handle: '.drag-handle',
        onEnd: () => {
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
        const isSelected = existingMarkerIds.includes(m.id);
        const gmMarker = new google.maps.Marker({
            position: { lat: m.lat, lng: m.lng },
            map: map,
            title: m.title,
            icon: isSelected ? 'https://maps.google.com/mapfiles/ms/icons/blue-dot.png' : null,
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