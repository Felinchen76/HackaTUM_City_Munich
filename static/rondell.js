let currentIndex = 0;
const items = document.querySelectorAll('.carousel-item');
const prevButton = document.querySelector('.prev');
const nextButton = document.querySelector('.next');

function showItem(index) {
    const totalItems = items.length;
    if (index < 0) {
        currentIndex = totalItems - 1; 
    } else if (index >= totalItems) {
        currentIndex = 0; 
    }
    const newTransformValue = -currentIndex * 100; 
    document.querySelector('.carousel-container').style.transform = `translateX(${newTransformValue}%)`;
}

prevButton.addEventListener('click', () => {
    currentIndex--;
    showItem(currentIndex);
});

nextButton.addEventListener('click', () => {
    currentIndex++;
    showItem(currentIndex);
});

setInterval(() => {
    currentIndex++;
    showItem(currentIndex);
}, 5000);

function searchEvents() {
    const searchQuery = document.getElementById('search').value.toLowerCase();
    const events = document.querySelectorAll('.event-item'); 
    const carouselItems = document.querySelectorAll('.carousel-item'); 


    events.forEach(event => {
        const eventTitle = event.getAttribute('data-title').toLowerCase();
        if (eventTitle.includes(searchQuery)) {
            event.style.display = 'block'; 
        } else {
            event.style.display = 'none'; 
        }
    });

    carouselItems.forEach(item => {
        const itemTitle = item.getAttribute('data-title').toLowerCase();
        if (itemTitle.includes(searchQuery)) {
            item.style.display = 'block'; 
        } else {
            item.style.display = 'none'; 
        }
    });
}
