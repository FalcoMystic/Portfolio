function myFunction() {
    var dropdown = document.getElementById("myDropdown");
    if (!dropdown) {
        return;
    }
    dropdown.classList.toggle("show");
}

window.onclick = function(event) {
    if (!event.target.closest('.dropdown')) {
        var dropdown = document.getElementById("myDropdown");
        if (dropdown && dropdown.classList.contains('show')) {
            dropdown.classList.remove('show');
        }
    }
}