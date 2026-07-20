const burger = document.getElementById('menu_maison');
const dropdown = document.getElementById('mobileMenuDropdown');

burger.addEventListener('click', () => {
    dropdown.classList.toggle('show');
});

document.addEventListener('click', function(event) {
    if (!burger.contains(event.target) && !dropdown.contains(event.target)) {
        dropdown.classList.remove('show');
    }
});