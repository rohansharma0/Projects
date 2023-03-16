import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);
//Navigation Animations

export const staggerReaveal = (node1, node2) => {
	gsap.from([node1, node2], {
		duration: 0.8,
		width: 0,
		// transformOrigin: "left",
		ease: "power3.inOut",
		stagger: {
			amount: 0.1,
		},
	});
};

export const staggerText = (node1, node2, node3) => {
	gsap.from([node1, node2, node3], {
		duration: 0.8,
		y: 150,
		delay: 0.25,
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

// //HomePage - Nav Animations

// export const NavTitleAnimation = (logo, node1, node2) => {
// 	let t1 = gsap.timeline();
// 	let t2 = gsap.timeline();
// 	let t3 = gsap.timeline();

// 	//FIXME: fix work logo animation
// 	t1.to(logo, {
// 		scrollTrigger: {
// 			trigger: "#work",
// 			start: "top center",
// 			scrub: true,
// 			end: "+=100",
// 		},
// 		y: -20,
// 		display: "none",
// 		opacity: 0,
// 		ease: "power3.inOut",
// 	});

// 	t1.from(node1, {
// 		y: +20,
// 		opacity: 0,
// 		display: "none",
// 	}).to(node1, {
// 		scrollTrigger: {
// 			trigger: "#work",
// 			start: "top center",
// 			scrub: true,
// 			end: "+=100",
// 		},
// 		y: 0,
// 		display: "block",
// 		opacity: 1,
// 		ease: "power3.inOut",
// 	});

// 	t2.from(node1, {
// 		y: 0,
// 		opacity: 1,
// 		display: "block",
// 	}).to(node1, {
// 		scrollTrigger: {
// 			trigger: "#project",
// 			start: "top center",
// 			scrub: true,
// 			end: "+=100",
// 		},
// 		y: -20,
// 		display: "none",
// 		opacity: 0,
// 		ease: "power3.inOut",
// 	});

// 	t3.from(node2, {
// 		y: +20,
// 		opacity: 0,
// 		display: "none",
// 	});
// 	t3.to(node2, {
// 		scrollTrigger: {
// 			trigger: "#project",
// 			start: "top center",
// 			scrub: true,
// 			end: "+=100",
// 		},
// 		y: 0,
// 		display: "block",
// 		opacity: 1,
// 		ease: "power3.inOut",
// 	});
// };

// //HomePage - Nav Animations

// export const NavAnimation = (node) => {
// 	gsap.from(node, {
// 		opacity: 0,
// 		y: -30,
// 		duration: 1,
// 		ease: "Power4.easeInOut",
// 	});
// };
// //HomePage - NavLink Animations

// export const NavLinkAnimation = (node) => {
// 	let t1 = gsap.timeline();

// 	t1.to(node, {
// 		scrollTrigger: {
// 			trigger: "#work",
// 			start: "top center",
// 			scrub: true,
// 			end: "+=100",
// 		},
// 		y: -20,
// 		display: "none",
// 		opacity: 0,
// 		ease: "power3.inOut",
// 	});
// };

// //HomePage - ScrollDown Animation
// export const ScrollDownAnimation = (node1, node2) => {
// 	var t1 = gsap.timeline();

// 	t1.from(node2, {
// 		y: -10,
// 	}).to(node2, {
// 		scrollTrigger: {
// 			trigger: "#project",
// 			start: "top center",
// 			scrub: true,
// 			end: "+=100",
// 		},
// 		y: +10,
// 		display: "block",
// 		opacity: 1,
// 		color: "#909090", //FIXME: change hold and drag text color
// 		ease: "power3.inOut",
// 	});
// 	t1.to(node1, {
// 		scrollTrigger: {
// 			trigger: "#work",
// 			start: "top center",
// 			scrub: true,
// 			end: "+=100",
// 		},
// 		y: +10,
// 		display: "none",
// 		opacity: 0,
// 		ease: "power3.inOut",
// 	});
// };

//HomePage - Hero animation
export const HeroAnimation = (node1, node2, node3, node4) => {
	var heroTl = gsap.timeline();

	heroTl
		.from(node1, {
			opacity: 0,
			duration: 0.6,
			y: 20,
			ease: "power3.inOut",
		})
		.from(node2, {
			y: "16vh",
			direction: 0.6,
			ease: "power3.inOut",
			stagger: {
				amount: 0.2,
			},
		})
		.from(node3, {
			y: 25,
			direction: 0.6,
			ease: "power3.inOut",
			stagger: {
				amount: 0.2,
			},
		})
		.from(node4, {
			y: 35,
			opacity: 0,
			direction: 0.6,
			ease: "power3.inOut",
		});
};

export const ScrollBtnAnimation = (node1) => {
	gsap.to(node1, {
		scrollTrigger: {
			trigger: "#hero-section",
			start: "70% center",
			// scroller: "#wrapper",
			end: "+=80",
			scrub: true,
		},
		y: +20,
		display: "none",
		opacity: 0,
		ease: "power3.inOut",
	});
};

//HomePage - work  animation
export const WorkAnimation = (node1, node2, node3) => {
	const workTl = gsap.timeline({
		scrollTrigger: {
			trigger: "#work-section",
			start: "top 80%",
			end: "center 60%",
			// scroller: "#wrapper",
			scrub: true,
		},
	});

	workTl
		.from(node1, {
			opacity: 0,
			duration: 0.4,
			y: 40,
			rotateX: 45,
			ease: "power3.inOut",
		})
		.from(node2, {
			y: "5vh",
			direction: 0.6,
			ease: "power3.inOut",
			stagger: {
				amount: 0.2,
			},
		})
		.from(node3, {
			y: "16vh",
			direction: 0.6,
			ease: "power3.inOut",
			stagger: {
				amount: 0.2,
			},
		});
};

//Project Animations

export const SwipeBtnAnimation = (node1) => {
	gsap.to(node1, {
		scrollTrigger: {
			trigger: "#project-section",
			start: "70% center",
			end: "+=80",
			// scroller: "#wrapper",
			scrub: true,
		},
		y: +20,
		display: "none",
		opacity: 0,
		ease: "power3.inOut",
	});
};

export const ProjectAnimation = (node1) => {
	const projectTl = gsap.timeline({
		scrollTrigger: {
			trigger: "#project-section",
			start: "top 80%",
			end: "center 60%",
			// scroller: "#wrapper",
			scrub: true,
		},
	});

	projectTl.from(node1, {
		opacity: 0,
		duration: 0.4,
		y: 40,
		rotateX: 45,
		ease: "power3.inOut",
	});
};

//Footer Animations

export const footerAnimation = (node1, node2, node3) => {
	const footerTl = gsap.timeline({
		scrollTrigger: {
			trigger: "#footer-section",
			start: "top 80%",
			end: "center 60%",
			// scroller: "#wrapper",
			scrub: true,
		},
	});

	footerTl
		.from(node1, {
			opacity: 0,
			duration: 0.4,
			y: 40,
			rotateX: 45,
			ease: "power3.inOut",
		})
		.from(node2, {
			opacity: 0,
			duration: 0.6,
			y: 40,
			ease: "power3.inOut",
			stagger: {
				amount: 0.2,
			},
		})
		.from(node3, {
			opacity: 0,
			x: -30,
			ease: "power3.inOut",
			duration: 0.6,
			stagger: {
				amount: 0.3,
			},
		});
};
