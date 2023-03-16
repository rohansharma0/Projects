import React, { useEffect, useRef, useState } from "react";
import { useLocation, withRouter } from "react-router-dom";
import { HamburgerAnimation } from "../Helper/Animations";
import Hamburger from "./Hamburger";
import { StyledMenu } from "./styles/Menu.styled";

import gsap from "gsap";

const Menu = ({ history }) => {
	//Menu Bar animations
	let bar1 = useRef(null);
	let bar2 = useRef(null);
	let bar3 = useRef(null);

	//url location
	let location = useLocation();

	//state for menu hide on larger devices
	const [isActive, setIsActive] = useState(true);
	const [width, setWidth] = useState(window.innerWidth);

	//state for menu toggle
	const [isMenuOn, setIsMenuOn] = useState({
		initial: false,
		clicked: null,
	});

	//state for disabled button
	const [disabled, setDisabled] = useState(false);

	//use effect for handle menu hiding
	useEffect(() => {
		window.addEventListener("resize", () => setWidth(window.innerWidth));
		if (
			width >= 1200 &&
			(location.pathname === "/about" || location.pathname === "/contact")
		) {
			setIsActive(false);
		} else {
			setIsActive(true);
		}
	}, [location, isActive, width]);

	//use effect for page changes

	useEffect(() => {
		history.listen(() => {
			setIsMenuOn({ clicked: false });
		});
		// MenuRevelAnimation(menu);
		//FIXME: fix animation
		gsap.to([bar1, bar2, bar3], {
			scrollTrigger: {
				trigger: "#project",
				start: "top center",
				end: "+=0",
				scrub: true,
			},
			backgroundColor: "#fff",
			ease: "power3.inOut",
		});
	});

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
				y: +8,
				rotateZ: 225,
				backgroundColor: "#fff",
				ease: "power3.inOut",
			});
			gsap.to(bar2, {
				scaleX: 0,
				backgroundColor: "#fff",
				ease: "power3.inOut",
			});
			gsap.to(bar3, {
				y: -8,
				rotateZ: 135,
				backgroundColor: "#fff",
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
				backgroundColor: "#323232",
				ease: "power3.inOut",
			});
			gsap.to(bar2, {
				scaleX: 1,
				backgroundColor: "#323232",
				ease: "power3.inOut",
			});
			gsap.to(bar3, {
				y: 0,
				rotateZ: 0,
				backgroundColor: "#323232",
				ease: "power3.inOut",
			});
		} else if (isMenuOn.clicked === false) {
			//menu is already off
			setIsMenuOn({
				clicked: !isMenuOn.clicked,
			});
			gsap.to(bar1, {
				y: +8,
				rotateZ: 225,
				backgroundColor: "#fff",
				ease: "power3.inOut",
			});
			gsap.to(bar2, {
				scaleX: 0,
				backgroundColor: "#fff",
				ease: "power3.inOut",
			});
			gsap.to(bar3, {
				y: -8,
				rotateZ: 135,
				backgroundColor: "#fff",
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
		//TODO: menu bar changes animation
		<div style={{ display: isActive ? "flex" : "none" }}>
			<StyledMenu>
				<button
					class="menu"
					onClick={handleMenu}
					disabled={disabled}
					id="menuBtn"
				>
					<div class="menu-bar" ref={(el) => (bar1 = el)}></div>
					<div class="menu-bar" ref={(el) => (bar2 = el)}></div>
					<div class="menu-bar" ref={(el) => (bar3 = el)}></div>
				</button>
			</StyledMenu>
			<Hamburger isActive={isMenuOn} />
		</div>
	);
};

export default withRouter(Menu);
