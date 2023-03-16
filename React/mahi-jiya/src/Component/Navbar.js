import React, { useEffect } from "react";

// react-router-dom
import { Link } from "react-router-dom";

// static files
import Logo from "../static/images/logo.svg";

const Navbar = ({ currentTab = "home" }) => {
  var isMenuOpen = false;

  useEffect(() => {
    if (window.innerWidth > 700) {
      window.onscroll = function () {
        scrollFuntion();
      };
    } else {
      document.getElementById("navbar").style.position = "sticky";
    }

    document.getElementById(currentTab).classList.add("active");
  }, []);

  const scrollFuntion = () => {
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
  };

  const toggleMenu = () => {
    document.getElementById("barOne").classList.toggle("line__one");
    document.getElementById("barTwo").classList.toggle("line__two");
    document.getElementById("barThree").classList.toggle("line__three");
    if (isMenuOpen) {
      document.getElementById("myNav").style.width = "0%";
      isMenuOpen = false;
    } else {
      document.getElementById("myNav").style.width = "100%";
      isMenuOpen = true;
    }
  };

  const gotoPage = () => {
    if (isMenuOpen) {
      toggleMenu();
    }
  };

  return (
    <nav className="navbar" id="navbar">
      <div className="logo__container">
        <Link to="/">
          <img src={Logo} alt="logo" />
        </Link>
      </div>
      <div className="nav__items" id="myNav">
        <ul>
          <li>
            <Link to="/" className="nav__links" id="home" onClick={gotoPage}>
              Home
            </Link>
          </li>
          <li>
            <Link
              to="/products"
              className="nav__links"
              id="products"
              onClick={gotoPage}
            >
              Products
            </Link>
          </li>
          <li>
            <Link
              to="/about"
              className="nav__links"
              id="about"
              onClick={gotoPage}
            >
              About
            </Link>
          </li>
          <li>
            <a
              className="nav__links"
              href="/#contact"
              id="gotoContact"
              onClick={gotoPage}
            >
              Contact
            </a>
          </li>
        </ul>
      </div>
      <div className="menu__container" onClick={toggleMenu}>
        <div className="line" id="barOne"></div>
        <div className="line" id="barTwo"></div>
        <div className="line" id="barThree"></div>
      </div>
    </nav>
  );
};

export default Navbar;
