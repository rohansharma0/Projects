import React from "react";

import Navbar from "../Component/Navbar";
import CarouselSection from "../Component/CarouselSection";
import Footer from "../Component/Footer";
import ContactSection from "../Component/ContactSection";
import TopProductsSection from "../Component/TopProductsSection";

const Home = () => {
  return (
    <div>
      <Navbar currentTab="home" />
      <CarouselSection />
      <TopProductsSection />
      <ContactSection />
      <Footer />
    </div>
  );
};

export default Home;
