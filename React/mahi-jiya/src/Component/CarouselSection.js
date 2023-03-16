import React, { useState, useEffect } from "react";

//firebase
import firebase from "firebase";

const CarouselSection = () => {
  const [images, setImages] = useState([]);

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

  const fetchImages = () => {
    return firebase
      .firestore()
      .collection("carousel")
      .onSnapshot((snap) => {
        const image = [];
        snap.forEach((doc) => {
          if (doc.exists) {
            image.push({ ...doc.data(), id: doc.id });
          }
        });
        setImages(image);
      });
  };

  useEffect(() => {
    fetchImages();
    showCarousel(slideIndex);
  }, []);

  return (
    <main class="slider__container">
      {images.map((image) => {
        return (
          <div class="slides">
            <img src={image?.imageUrl} key={image.id} alt="image" />
          </div>
        );
      })}
      <div class="carousel__nav">
        <span onclick="plusSlide(-1)" id="moveLeft" class="carousel__arrow">
          <svg
            class="carousel__icon"
            width="24"
            height="24"
            viewBox="0 0 24 24"
          >
            <path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
          </svg>
        </span>
        <span onclick="plusSlide(1)" id="moveRight" class="carousel__arrow">
          <svg
            class="carousel__icon"
            width="24"
            height="24"
            viewBox="0 0 24 24"
          >
            <path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
          </svg>
        </span>
      </div>
    </main>
  );
};

export default CarouselSection;
