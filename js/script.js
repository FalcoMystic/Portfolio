// Appliquer le thème au chargement
function initTheme() {
    const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;
    const theme = prefersDark ? "dark" : "light";
    document.documentElement.setAttribute("data-theme", theme);
}

// Initialiser au chargement
initTheme();

// Écouter les changements de préférence système
window
    .matchMedia("(prefers-color-scheme: dark)")
    .addEventListener("change", (e) => {
        const theme = e.matches ? "dark" : "light";
        document.documentElement.setAttribute("data-theme", theme);
    });