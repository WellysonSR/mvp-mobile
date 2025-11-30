const hamburger = document.getElementById('hamburger');
const mobileMenu = document.getElementById('mobileMenu');

function toggleMenu() {
    mobileMenu.classList.toggle('active');

    const expanded = hamburger.getAttribute('aria-expanded') === 'true';
    hamburger.setAttribute('aria-expanded', String(!expanded));
    mobileMenu.setAttribute('aria-hidden', String(expanded));
}

if (hamburger) {
    hamburger.addEventListener('click', toggleMenu);
}