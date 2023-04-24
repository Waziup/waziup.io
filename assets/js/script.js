// homepage banner slider
document.addEventListener("DOMContentLoaded", function () {
  const sliderContainers = document.querySelectorAll(".slider-container");
  sliderContainers.forEach(function (container, i) {
    const sliderBullets = container.querySelectorAll(".slider-nav > a");
    const sliderImages = container.querySelectorAll(".slider > div");

    let index = 0;
    sliderBullets.forEach(function (bullet, i) {
      bullet.addEventListener("click", function () {
        const image = sliderImages[i];
        const slider = image.parentElement;
        slider.scrollLeft = image.offsetLeft;
      });
    });

    setInterval(() => {
      index++;
      index = index % sliderImages.length;
      const image = sliderImages[index];
      const slider = image.parentElement;
      slider.scrollLeft = image.offsetLeft;
    }, 5000);
  });
});


//======= accordions =========
var acc = document.getElementsByClassName("accordion");
var acc_counter;

for (acc_counter = 0; acc_counter < acc.length; acc_counter++) {
  acc[acc_counter].addEventListener("click", function () {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}

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