import React, { useState, useRef, useEffect } from "react";
import { Link } from "react-router-dom";
import { Nav } from "./styles/Nav.styled";

function Header() {
    let navbar = useRef(null);

    const [menu, setMenu] = useState({
        initial: false,
        clicked: null,
    });

    useEffect(() => {
        if (menu.clicked === false) {
            navbar.style.display = "none";
        } else if (
            menu.clicked === true ||
            (menu.clicked === true && menu.initial === null)
        ) {
            navbar.style.display = "flex";
        }
    });

    const handleMenu = () => {
        if (menu.initial === false) {
            setMenu({
                initial: null,
                clicked: true,
            });
            console.log(1);
        } else if (menu.clicked === true) {
            setMenu({
                clicked: !menu.clicked,
            });
            console.log(2);
        } else if (menu.clicked === false) {
            setMenu({
                clicked: !menu.clicked,
            });
            console.log(3);
        }
    };

    return (
        <Nav>
            <Link class="nav-logo" to="/">
                <p>
                    <span>A</span>gantuk
                </p>
            </Link>
            <div ref={(el) => (navbar = el)} class="nav-links">
                <div class="close icon" onClick={handleMenu}></div>
                <div class="links">
                    <Link to="/" class="active">
                        Home
                    </Link>
                    <Link to="/stories">Stories</Link>
                    <Link to="/about">About</Link>
                    <Link to="/contact">Contact</Link>
                </div>
            </div>
            <div class="menu icon" onClick={handleMenu}></div>
        </Nav>
    );
}

export default Header;
