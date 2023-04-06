// let slideIndex = 0;
// // showSlides();

// function showSlides() {
//   console.log("hi");

//   let i;
//   let slides = document.getElementsByClassName("mySlides");
//   let dots = document.getElementsByClassName("dot");
//   for (i = 0; i < slides.length; i++) {
//     slides[i].style.display = "none";
//   }
//   slideIndex++;
//   if (slideIndex > slides.length) {
//     slideIndex = 1;
//   }
//   for (i = 0; i < dots.length; i++) {
//     dots[i].className = dots[i].className.replace(" active", "");
//   }
//   slides[slideIndex - 1].style.display = "block";
//   dots[slideIndex - 1].className += " active";
//   setTimeout(showSlides, 5000); // Change image every 2 seconds
// }
// window.onload = showSlides;


/*******Add active class to the current button (highlight it) *******/

// var header = document.getElementById("myNav");
// var navItem = header.getElementsByClassName("nav-item");
// console.log("checking: ", navItem.length);
// for (var i = 0; i < navItem.length; i++) {
//   navItem[i].addEventListener("click", function() {
//     var current = document.getElementsByClassName("nav-active");
//     current[0].className = current[0].className.replace(" nav-active", "");
//     this.className += " nav-active";
//   });
// }

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