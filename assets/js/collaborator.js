document.addEventListener('DOMContentLoaded', function() {
    const toggleButton = document.getElementById('toggleButtons');
    const addButton = document.querySelector('.cta-button:nth-child(2)');
    const filterButton = document.querySelector('.cta-button:nth-child(3)');

    toggleButton.addEventListener('click', function() {
        addButton.classList.toggle('d-none');
        addButton.classList.toggle('d-block');
        filterButton.classList.toggle('d-none');
        filterButton.classList.toggle('d-block');
    });
});