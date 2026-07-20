document.addEventListener('DOMContentLoaded', function () {
    // // Désactiver Vanta sur la page Projets
    // if (window.location.pathname.includes('projects')) {
    //     return;
    // }
    VANTA.DOTS({
        el: "#vanta-dots",
        mouseControls: false,
        touchControls: true,
        gyroControls: false,
        minHeight: 200.00,
        minWidth: 200.00,
        scale: 1.00,
        scaleMobile: 1.00,
        color: 0x7b20ff,
        color2: 0x7b20ff,
        backgroundColor: 0x161616,
        size: 2.5,
        spacing: 80.00,
        showLines: false
    });
});
