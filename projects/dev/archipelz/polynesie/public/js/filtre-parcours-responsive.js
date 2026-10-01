function toggleFiltre() {
    const filtre = document.getElementById('bloc-filtre');
    if (!filtre) return;
    if (!window.matchMedia('(max-width: 700px)').matches) return;
    filtre.classList.toggle('is-open');
}

document.addEventListener('DOMContentLoaded', () => {
    const btnToggle = document.getElementById('btn-filtre-toggle');
    if (!btnToggle) return;
    btnToggle.addEventListener('click', toggleFiltre);
});

window.addEventListener('resize', () => {
    const filtre = document.getElementById('bloc-filtre');
    if (!filtre) return;
    if (!window.matchMedia('(max-width: 700px)').matches) {
        filtre.classList.remove('is-open');
    }
});