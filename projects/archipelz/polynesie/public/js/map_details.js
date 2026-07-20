function initMap() {
    var tahiti = { lat: -17.650920, lng: -149.426042 };
    var map = new google.maps.Map(document.getElementById("carte"), {
        center: tahiti,
        zoom: 10
    });

    const infoWindow = new google.maps.InfoWindow();
    const markersData = window.markersData ?? [];
    const markersOrder = window.markersOrder ?? [];

    // Trier les markers selon l'ordre sauvegardé
    const orderedMarkers = markersOrder.length > 0
        ? markersOrder.map(id => markersData.find(m => m.id === id)).filter(Boolean)
        : markersData;

    if (orderedMarkers.length > 0) {
        map.setCenter({ lat: orderedMarkers[0].lat, lng: orderedMarkers[0].lng });
    }

    // Afficher les markers
    orderedMarkers.forEach((m, index) => {
        const gmMarker = new google.maps.Marker({
            position: { lat: m.lat, lng: m.lng },
            map: map,
            title: m.title,
            label: {
                text: String(index + 1),
                color: 'white',
                fontWeight: 'bold',
                fontSize: '14px',
            },
            icon: {
                path: google.maps.SymbolPath.CIRCLE,
                scale: 18,
                fillColor: '#FF0000',
                fillOpacity: 1,
                strokeColor: '#ffffff',
                strokeWeight: 2,
            }
        });

        gmMarker.addListener('click', () => {
            const displayTitle = m.customTitle ?? m.title;
            const displayDescription = m.customDescription ?? m.description;
            const contenu = `
                <div style="max-width:220px; font-family:sans-serif;">
                    ${m.photo ? `<img src="${m.photo}" alt="${displayTitle}" style="width:100%; border-radius:6px; margin-bottom:8px;">` : ''}
                    <strong>${displayTitle}</strong>
                    <p style="font-size:0.85em; color:#555; margin-top:4px;">${displayDescription}</p>
                </div>
            `;
            infoWindow.setContent(contenu);
            infoWindow.open(map, gmMarker);
        });
    });

    // Tracer la Polyline dans l'ordre
    if (orderedMarkers.length > 1) {
        const polyline = new google.maps.Polyline({
            path: orderedMarkers.map(m => ({ lat: m.lat, lng: m.lng })),
            geodesic: true,
            strokeColor: '#FF0000',
            strokeOpacity: 1.0,
            strokeWeight: 2,
        });
        polyline.setMap(map);
    }
}