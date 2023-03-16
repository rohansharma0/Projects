// Carousel

var slideIndex = 1;
showCarousel(slideIndex);

// Next/previous controls
function plusSlide(n) {
  showCarousel((slideIndex += n));
}

function showCarousel(n) {
  var i;
  var slides = document.getElementsByClassName("slides");
  if (n > slides.length) {
    slideIndex = 1;
  }
  if (n < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slides[slideIndex - 1].style.display = "block";
}

// Navbar

if (screen.width > 700) {
  window.onscroll = function () {
    scrollFun();
  };
  console.log(screen.width);
  function scrollFun() {
    if (
      document.body.scrollTop >= 150 ||
      document.documentElement.scrollTop >= 150
    ) {
      document.getElementById("navbar").style.position = "sticky";
      document.getElementById("navbar").style.height = "4rem";
    } else {
      document.getElementById("navbar").style.height = "5rem";
      document.getElementById("navbar").style.position = "inherit";
    }
  }
} else {
  document.getElementById("navbar").style.position = "sticky";
}

// Menu
var menuOpen = false;
function toggleMenu() {
  document.getElementById("barOne").classList.toggle("line__one");
  document.getElementById("barTwo").classList.toggle("line__two");
  document.getElementById("barThree").classList.toggle("line__three");
  if (menuOpen) {
    document.getElementById("myNav").style.width = "0%";
    menuOpen = false;
  } else {
    document.getElementById("myNav").style.width = "100%";
    menuOpen = true;
  }
}

//smooth scrolling

// function smoothScroll(target, duration) {
//     var target = document.getElementById(target);
//     var targetPosition = target.getBoundingClientRect().top;
//     var startPosition = window.pageYOffset;
//     var distance = targetPosition - startPosition;
//     var startTime = null;

//     function animation(currentTime) {
//         if (startTime === null) startTime = currentTime;
//         var timeElapsed = currentTime - startTime;
//         var run = easeInCubic(timeElapsed, startPosition, distance, duration);
//         window.scrollTo(0, run);
//         if (timeElapsed < duration) requestAnimationFrame(animation);
//     }
//     function easeInSine(t, b, c, d) {
//         t /= d / 2;
//         if (t < 1) return c / 2 * t * t + b;
//         t--;
//         return -c / 2 * (t * (t - 2) - 1) + b;
//     };
//     function easeInCubic(t, b, c, d) {
//         t /= d;
//         return c*t*t*t + b;
//     };

//     requestAnimationFrame(animation);
// }

// var gotoContact = document.getElementById("gotoContact");

// gotoContact.addEventListener('click', function () {
//     smoothScroll('gotoContact', 1000);
// })
