import React, { useEffect, useRef, useState } from "react";
import { StyledFooter } from "./styles/Footer.styled";

//Animations
import { ScrollDownAnimation } from "../Helper/Animations";
import gsap from "gsap";

const Footer = () => {
	let scrollDown = useRef(null);
	let holdandDrag = useRef(null);
	let footer = useRef(null);

	const [width, setWidth] = useState(window.innerWidth);

	useEffect(() => {
		window.addEventListener("resize", () => setWidth(window.innerWidth));
	}, [width]);

	useEffect(() => {
		ScrollDownAnimation(scrollDown, holdandDrag);

		// let t = gsap.timeline();
		// t.to(footer, {
		// 	scrollTrigger: {
		// 		trigger: "#project",
		// 		markers: true,
		// 		start: "bottom bottom",
		// 		scrub: true,
		// 		end: "-=50",
		// 	},
		// 	height: 0,
		// }).to(footer, {
		// 	scrollTrigger: {
		// 		trigger: "#project",
		// 		markers: true,
		// 		start: "top bottom",
		// 		scrub: true,
		// 		end: "+=50",
		// 	},
		// 	backgroundColor: "#323232",
		// 	height: "8.4vh",
		// });
	});

	return (
		<StyledFooter class="footer" id="footer" ref={(el) => (footer = el)}>
			<div class="footer-text-scrollDown" ref={(el) => (scrollDown = el)}>
				Scroll Down
			</div>
			<div class="footer-text-holdDrag" ref={(el) => (holdandDrag = el)}>
				{width >= 650 ? "Hold and Drag" : "Swipe"}
			</div>
		</StyledFooter>
	);
};

export default Footer;
