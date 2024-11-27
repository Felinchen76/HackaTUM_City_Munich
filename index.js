const burger = document.querySelector('.burger');
const navMenu = document.getElementById('nav-menu');

burger.addEventListener('click', () => {
    navMenu.classList.toggle('active'); 
});

navMenu.addEventListener('click', (e) => {
    if (e.target.tagName === 'A') { 
        navMenu.classList.remove('active');
    }
});

document.addEventListener('click', (e) => {
    if (!navMenu.contains(e.target) && !burger.contains(e.target)) {
        navMenu.classList.remove('active');
    }
});
