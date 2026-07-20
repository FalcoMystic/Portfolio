document.getElementById('btn_add_tag').addEventListener('click', async () => {
    const name = document.getElementById('new_tag_name').value.trim();
    if (!name) return;

    const response = await fetch(window.tagCreateUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name })
    });

    const data = await response.json();

    if (data.success) {
        // Ajoute dynamiquement la case à cocher sans recharger la page
        const container = document.querySelector('#route_add_tags'); // id généré par Symfony
        const label = document.createElement('label');
        label.innerHTML = `
            <input type="checkbox" name="route_add[tags][]" value="${data.id}" checked>
            ${data.name}
        `;
        container.appendChild(label);

        document.getElementById('new_tag_name').value = '';
        document.getElementById('tag_feedback').textContent = `Tag "${data.name}" créé !`;
    } else {
        document.getElementById('tag_feedback').textContent = data.error;
    }
});