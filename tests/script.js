const carousel = document.getElementById("carousel");
const slides = document.querySelectorAll(".carousel-slide");
const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

let currentIndex = 0;

// Update the carousel position
function updateCarousel() {
  const offset = -currentIndex * 100; // Calculate the offset in percentage
  carousel.style.transform = `translateX(${offset}%)`;
}

// Move to the next slide
nextBtn.addEventListener("click", () => {
  currentIndex = (currentIndex + 1) % slides.length; // Wrap around to the first slide
  updateCarousel();
});

// Move to the previous slide
prevBtn.addEventListener("click", () => {
  currentIndex = (currentIndex - 1 + slides.length) % slides.length; // Wrap around to the last slide
  updateCarousel();
});