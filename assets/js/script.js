// homepage banner slider
document.addEventListener("DOMContentLoaded", function () {
  const sliderContainers = document.querySelectorAll(".slider-wrapper");
  sliderContainers.forEach(function (container, i) {
    const sliderBullets = container.querySelectorAll(".slider-nav > a");
    const slider = container.querySelectorAll(".slider")[0];
    const slides = container.querySelectorAll(".slider > .slide");

    let index = 0;
    sliderBullets.forEach(function (bullet, i) {
      bullet.addEventListener("click", function () {
        slider.scrollLeft = slides[i].offsetLeft;
      });
    });

    setInterval(() => {
      console.log(index)
      console.log(slides.length)
      index = (index + 1) % slides.length;
      slider.scrollLeft = slides[index].offsetLeft;
    }, 5000);
  });
});



//====== nav-active =============
var header = document.getElementById("myNav");
var navItem = header.getElementsByClassName("nav-item");
console.log("checking: ", navItem.length);
for (var i = 0; i < navItem.length; i++) {
  navItem[i].addEventListener("click", function () {
    var current = document.getElementsByClassName("nav-active");
    console.log("checking click: ", current);
    current[0].className = current[0].className.replace(" nav-active", "");
    this.className += " nav-active";
  });
}
