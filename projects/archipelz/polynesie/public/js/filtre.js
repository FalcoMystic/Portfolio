document.querySelectorAll(".toggle-btn").forEach(button => {
    button.addEventListener("click", function () {
        const content = this.parentElement.nextElementSibling;
        if (!content) return;

        if (content.style.display === "none") {
            content.style.display = "flex";
            this.textContent = "−";
        } else {
            content.style.display = "none";
            this.textContent = "+";
        }
    });
});