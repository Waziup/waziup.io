document.addEventListener("DOMContentLoaded", function () {
    const sliderContainers = document.querySelectorAll(".slider-container");
    sliderContainers.forEach(function (container, i) {
        const sliderBullets = container.querySelectorAll(".slider-nav > a");
        const sliderImages = container.querySelectorAll(".slider > img");
        
        let index = 0;
        sliderBullets.forEach(function (bullet, i) {
            bullet.addEventListener("click", function () {
                const image = sliderImages[i];
                const slider = image.parentElement;
                slider.scrollLeft = image.offsetLeft;
            });
        });

        setInterval(() => {
            index ++;
            index = index % sliderImages.length;
            const image = sliderImages[index];
            const slider = image.parentElement;
            slider.scrollLeft = image.offsetLeft;
        }, 5000);
    });
});