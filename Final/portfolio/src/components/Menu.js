import React, { useEffect, useRef, useState } from "react";
import Hamburger from "./Hamburger";
import { StyledMenu } from "./styles/Menu.styled";
import gsap from "gsap";
import { useLocation } from "react-router-dom";

const Menu = () => {
	//menu bar animations
	let bar1 = useRef(null);
	let bar2 = useRef(null);

	//state for disabled button
	const [disabled, setDisabled] = useState(false);

	//state for menu toggle
	const [isMenuOn, setIsMenuOn] = useState({
		initial: false,
		clicked: null,
	});

	const location = useLocation();

	useEffect(() => {
		if (isMenuOn.initial != false) {
			handleMenu();
		}
	}, [location]);

	//handle menu button
	const handleMenu = () => {
		//disable menu btn for spam
		disabledMenu();
		//Amimations

		if (isMenuOn.initial === false) {
			//1st time clicked
			setIsMenuOn({
				initial: null,
				clicked: true,
			});
			//animations
			gsap.to(bar1, {
				y: +5,
				rotateZ: 225,
				ease: "power3.inOut",
			});
			gsap.to(bar2, {
				y: -2,
				rotateZ: 135,
				ease: "power3.inOut",
			});
		} else if (isMenuOn.clicked === true) {
			//menu is already on
			setIsMenuOn({
				clicked: !isMenuOn.clicked,
			});
			gsap.to(bar1, {
				y: 0,
				rotateZ: 0,
				ease: "power3.inOut",
			});
			gsap.to(bar2, {
				y: 0,
				rotateZ: 0,
				ease: "power3.inOut",
			});
		} else if (isMenuOn.clicked === false) {
			//menu is already off
			setIsMenuOn({
				clicked: !isMenuOn.clicked,
			});
			gsap.to(bar1, {
				y: +5,
				rotateZ: 225,
				ease: "power3.inOut",
			});

			gsap.to(bar2, {
				y: -2,
				rotateZ: 135,
				ease: "power3.inOut",
			});
		}
	};

	//handle disable menu btn for spam
	const disabledMenu = () => {
		setDisabled(!disabled);
		setTimeout(() => {
			setDisabled(false);
		}, 1000);
	};

	return (
		<StyledMenu className="menu-container ">
			<button
				className="menu clickableLinkGlow"
				id="menuBtn"
				onClick={handleMenu}
				disabled={disabled}
			>
				<div className="menu-bar" ref={(el) => (bar1 = el)}></div>
				<div className="menu-bar" ref={(el) => (bar2 = el)}></div>
			</button>
			<Hamburger isActive={isMenuOn} />
		</StyledMenu>
	);
};
export default Menu;
