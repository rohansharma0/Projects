import React, { useEffect, useRef, useState, useLayoutEffect } from "react";
import { Link, useLocation } from "react-router-dom";
import Logo from "./Logo";

import fbLogo from "../static/img/facebook.svg";
import lnLogo from "../static/img/linkedin.svg";
import inLogo from "../static/img/instagram.svg";

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

	const [width, setWidth] = useState(window.innerWidth);

	useLayoutEffect(() => {
		window.addEventListener("resize", () => setWidth(window.innerWidth));
	}, [width]);

	//Menu Animations
	let showHideElement = document.getElementsByClassName("showHide");
	let menu = useRef(null);
	let revealMenu = useRef(null);
	let revealMenuBackground = useRef(null);
	let line1 = useRef(null);
	let line2 = useRef(null);
	let line3 = useRef(null);

	//use effect for menu animation
	let t1 = gsap.timeline();

	useEffect(() => {
		if (isActive.clicked === false) {
			//close menu
			gsap.to(showHideElement, {
				opacity: 0,
				duration: 0.5,
				ease: "power3.inOut",
			});
			gsap.to([revealMenu, revealMenuBackground], {
				duration: 0.8,
				width: 0,
				// transformOrigin: "left",
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
				width: "100%",
				ease: "power3.inOut",
			});

			staggerReaveal(revealMenuBackground, revealMenu);
			gsap.to(showHideElement, {
				opacity: 1,
				duration: 0.3,
				delay: 0.5,
				ease: "power3.inOut",
			});
			staggerText(line1, line2, line3);
		}
	}, [isActive]);

	useEffect(() => {
		let elements = document.querySelectorAll(".rolling-text");

		elements.forEach((el) => {
			let innerText = el.innerHTML;
			el.innerHTML = "";

			let textContainer = document.createElement("div");
			textContainer.classList.add("block");

			for (let letter of innerText) {
				let span = document.createElement("span");
				span.innerHTML = letter.trim() === "" ? "\xa0" : letter;
				span.classList.add("letter");
				textContainer.appendChild(span);
			}
			el.appendChild(textContainer);
			el.appendChild(textContainer.cloneNode(true));
		});

		elements.forEach((el) => {
			el.addEventListener("mousemove", () => {
				el.classList.remove("play");
			});
		});
	}, []);

	return (
		<StyledHamburger ref={(el) => (menu = el)}>
			<div
				ref={(el) => (revealMenuBackground = el)}
				class="menu-secondary-bg-color"
			></div>
			<div ref={(el) => (revealMenu = el)} class="container">
				<div class="menu-links">
					<ul>
						<li class="nav-link showHide clickableLinkGlow">
							<Link
								// onMouseEnter={(e) => handleHover(e)}
								// onMouseOut={(e) => handleHoverExit(e)}
								ref={(el) => (line1 = el)}
								to="/"
							>
								<span data-text="Home.">Home.</span>
							</Link>
						</li>
						<li class="nav-link showHide clickableLinkGlow">
							<Link
								// onMouseEnter={(e) => handleHover(e)}
								// onMouseOut={(e) => handleHoverExit(e)}
								ref={(el) => (line2 = el)}
								to="/about"
							>
								<span data-text="About.">About.</span>
							</Link>
						</li>
						<li class="nav-link showHide clickableLinkGlow">
							<Link
								// onMouseEnter={(e) => handleHover(e)}
								// onMouseOut={(e) => handleHoverExit(e)}
								ref={(el) => (line3 = el)}
								to="/contact"
							>
								<span data-text="Contact.">Contact.</span>
							</Link>
						</li>
					</ul>
				</div>
			</div>
			<div className="footer">
				<div className="footer-links showHide">
					<a
						href="https://www.instagram.com/rohan__sharma0/"
						target="_blank"
						className="clickableLinkShrink"
					>
						{width >= 1200 ? (
							<p className="rolling-text">instagram</p>
						) : (
							<img src={inLogo} />
						)}
					</a>
					<a
						href="https://www.linkedin.com/in/rohan-sharma-bb34b1188"
						target="_blank"
						className="clickableLinkShrink"
					>
						{width >= 1200 ? (
							<p className="rolling-text">linkedin</p>
						) : (
							<img src={lnLogo} />
						)}
					</a>
					<a
						href="https://www.facebook.com/rohan.sharma.9903"
						target="_blank"
						className="clickableLinkShrink"
					>
						{width >= 1200 ? (
							<p className="rolling-text">facebook</p>
						) : (
							<img src={fbLogo} />
						)}
					</a>
				</div>
				<div className="copyright showHide">
					<p>
						<span>©️</span> 2022{" "}
						{width >= 1200 ? "rohansharma.codes" : ""}
					</p>
				</div>
			</div>
		</StyledHamburger>
	);
};

export default Hamburger;
