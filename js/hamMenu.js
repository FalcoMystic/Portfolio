const hamMenu = document.querySelector(".ham-menu-phone");

const offScreenMenu = document.querySelector(".off-screen-menu-phone");

hamMenu.addEventListener("click", () => {
    hamMenu.classList.toggle("active");
    offScreenMenu.classList.toggle("active");
})