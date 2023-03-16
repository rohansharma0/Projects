import gsap from "gsap";

import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

//Navigation Animations

export const staggerReaveal = (node1, node2) => {
	gsap.from([node1, node2], {
		duration: 0.8,
		height: 0,
		transformOrigin: "right top",
		skewY: 2,
		ease: "power3.inOut",
		stagger: {
			amount: 0.1,
		},
	});
};

export const staggerText = (node1, node2, node3, node4) => {
	gsap.from([node1, node2, node3], {
		duration: 0.8,
		y: 150,
		delay: 0.1,
		ease: "power3.inOut",
		stagger: {
			amount: 0.3,
		},
	});
};

//handle link hover animation

export const handleHover = (e) => {
	gsap.to(e.target, {
		duration: 0.3,
		y: 3,
		skewX: 4,
		ease: "Power3.inOut",
	});
};

export const handleHoverExit = (e) => {
	gsap.to(e.target, {
		duration: 0.3,
		y: -3,
		skewX: 0,
		ease: "Power3.inOut",
	});
};

//HomePage - Nav Animations

export const NavAnimation = (node) => {
	gsap.from(node, {
		opacity: 0,
		y: -30,
		duration: 1,
		ease: "Power4.easeInOut",
	});
};

//HomePage - ScrollDown Animation
export const ScrollDownAnimation = (node) => {
	gsap.to(node, {
		scrollTrigger: {
			trigger: ".scroll-down",
			start: "top center",
			scrub: true,
			end: "+=100",
		},
		opacity: 0,
		duration: 0.1,
		ease: "Power4.easeInOut",
	});
};

//HomePage - Hero animation
export const HeroAnimation = (node1, node2, node3, node4, resumeBtn) => {
	var t1 = gsap.timeline();

	t1.from([node1, node2], {
		y: "100%",
		stagger: 0.6,
		ease: "Power4.easeInOut",
	})
		.from([node3, node4], { opacity: 0, x: -40, ease: "Power4.easeInOut" })
		.from(
			resumeBtn,
			{ opacity: 0, y: 20, ease: "Power4.easeInOut" },
			"-=0.5",
		);
};
