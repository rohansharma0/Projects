import React, { useEffect, useRef, useState } from "react";
import { Link, useLocation } from "react-router-dom";

import gsap from "gsap";

//FIXME: hover effect not working on mobile
import { StyledHamburger } from "./styles/Hamburger.styled";
import {
	handleHover,
	handleHoverExit,
	staggerReaveal,
	staggerText,
} from "../Helper/Animations";

const Hamburger = ({ isActive }) => {
	//link change using url params
	let location = useLocation();

	const [currentTab, setCurrentTab] = useState(0);

	useEffect(() => {
		// "/" --> 0
		// "about" --> 1
		// "contact" --> 2

		if (location.pathname === "/") {
			setCurrentTab(0);
		} else if (location.pathname === "/about") {
			setCurrentTab(1);
		} else if (location.pathname === "/contact") {
			setCurrentTab(2);
		}
	}, [location, currentTab]);

	//Menu Animations
	let menu = useRef(null);
	let revealMenu = useRef(null);
	let revealMenuBackground = useRef(null);
	let line1 = useRef(null);
	let line2 = useRef(null);
	let line3 = useRef(null);

	//use effect for menu animation

	useEffect(() => {
		if (isActive.clicked === false) {
			//close menu
			gsap.to([revealMenu, revealMenuBackground], {
				duration: 0.8,
				height: 0,
				ease: "power3.inOut",
				stagger: {
					amount: 0.07,
				},
			});

			gsap.to(menu, {
				duration: 1,
				css: { display: "none" },
			});
		} else if (
			isActive.clicked === true ||
			(isActive.clicked === true && isActive.initial === null)
		) {
			//open menu
			gsap.to(menu, {
				duration: 1,
				css: { display: "grid" },
			});
			gsap.to([revealMenuBackground, revealMenu], {
				duration: 0,
				opacity: 1,
				height: "100vh",
				ease: "power3.inOut",
			});
			staggerReaveal(revealMenuBackground, revealMenu);
			staggerText(line1, line2, line3);
		}
	}, [isActive]);

	return (
		<StyledHamburger ref={(el) => (menu = el)}>
			<div
				ref={(el) => (revealMenuBackground = el)}
				class="menu-secondary-bg-color"
			></div>
			<div ref={(el) => (revealMenu = el)} class="container">
				<div class="menu-links">
					<ul>
						<li class="nav-link">
							<Link
								onMouseEnter={(e) => handleHover(e)}
								onMouseOut={(e) => handleHoverExit(e)}
								class={currentTab === 0 ? "active" : ""}
								ref={(el) => (line1 = el)}
								to="/"
							>
								Projects
							</Link>
						</li>
						<li class="nav-link">
							<Link
								onMouseEnter={(e) => handleHover(e)}
								onMouseOut={(e) => handleHoverExit(e)}
								class={currentTab === 1 ? "active" : ""}
								ref={(el) => (line2 = el)}
								to="/about"
							>
								About
							</Link>
						</li>
						<li class="nav-link">
							<Link
								onMouseEnter={(e) => handleHover(e)}
								onMouseOut={(e) => handleHoverExit(e)}
								class={currentTab === 2 ? "active" : ""}
								ref={(el) => (line3 = el)}
								to="/contact"
							>
								Contact
							</Link>
						</li>
					</ul>
				</div>
			</div>
		</StyledHamburger>
	);
};

export default Hamburger;
