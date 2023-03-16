import React, { useEffect, useRef, useState } from "react";
import { StyledHomeProject } from "./styles/Home.Project.styled";

import { motion } from "framer-motion";
//images
import image1 from "../static/images/img-one.jpeg";
import image2 from "../static/images/img-two.jpeg";
import image3 from "../static/images/img-three.jpeg";
import image4 from "../static/images/img-four.jpeg";
import image5 from "../static/images/img-five.jpeg";
import { StyledProject } from "./styles/Project.styled";

const Project = () => {
	let container = useRef(null);
	let block = useRef(null);

	const [width, setWidth] = useState(0);
	let scrollContainer = useRef(null);

	useEffect(() => {
		//FIXME: fix
		setWidth(scrollContainer.scrollWidth - scrollContainer.offsetWidth);
	}, []);

	// useEffect(() => {
	// 	const scroll = new LocomotiveScroll({
	// 		el: document.querySelector("[data-scroll-container]"),
	// 		smooth: true,
	// 		smartphone: {
	// 			smooth: true,
	// 		},
	// 		getDirection: true,
	// 		getSpeed: true,
	// 		direction: "horizontal",
	// 	});

	// 	scroll.on("scroll", () => {
	// 		// let dis = scroll.current.current - scroll.current.cache;
	// 		// block.current.style.transform = 'skewX("4deg")';
	// 		console.log(scroll);
	// 	});
	// }, []);

	// useEffect(() => {
	// 	// let slider = document.querySelector(".project-wrapper");

	// 	let startx;
	// 	let x;
	// 	// if (slider != null) {
	// 	container.addEventListener("mousedown", (e) => {
	// 		setPressed(true);
	// 		if (container !== null && block != null) {
	// 			startx = e.offsetX - block.offsetLeft;
	// 			container.style.cursor = "grabbing";
	// 			console.log(`mousedown - ${startx}`);
	// 		}
	// 	});

	// 	container.addEventListener("mouseenter", (e) => {
	// 		if (container !== null) {
	// 			container.style.cursor = "grab";
	// 			// console.log(startx);
	// 		}
	// 	});

	// 	container.addEventListener("mouseleave", (e) => {
	// 		if (container !== null) {
	// 			container.style.cursor = "default";
	// 			// console.log(startx);
	// 			console.log(`mousemove`);
	// 		}
	// 	});

	// 	container.addEventListener("mouseup", (e) => {
	// 		setPressed(false);
	// 		console.log(`mouseup`);
	// 	});
	// 	container.addEventListener("mousemove", (e) => {
	// 		if (!pressed) return;
	// 		e.preventDefault();

	// 		if (e != null) {
	// 			x = e.offsetX;

	// 			console.log(`mousemove - ${x - startx}`);

	// 			container.style.left = `${x - startx}px`;
	// 		}
	// 	});
	// });

	const mouseDown = () => {
		container.style.cursor = "grabbing";
	};

	// const mouseEnter = () => {
	// 	container.style.cursor = "grab";
	// };
	// const mouseLeave = () => {
	// 	container.style.cursor = "default";
	// };

	return (
		<StyledHomeProject>
			<div class="top">
				<p>
					<span class="tag"></span>My Projects
				</p>
			</div>
			<StyledProject ref={(el) => (scrollContainer = el)}>
				<div class="project-info">
					<div class="info">
						<li>01</li>
						<p>UI Wire-framing</p>
						<p>UI Designs</p>
						<p>FE Development</p>
					</div>
				</div>
				<motion.div
					class="container"
					drag="x"
					ref={(el) => (container = el)}
					dragConstraints={{ right: 0, left: -width }}
					// onMouseDown={mouseDown}
					// onMouseEnter={mouseEnter}
					// onMouseLeave={mouseLeave}
				>
					<motion.div class="block block-1">
						<img src={image1} class="sepia" />
						<img src={image1} class="masked" />
					</motion.div>
					<motion.div class="block block-2">
						<img src={image2} class="sepia" />
						<img src={image2} class="masked" />
					</motion.div>
					<motion.div class="block block-3">
						<img src={image3} class="sepia" />
						<img src={image3} class="masked" />
					</motion.div>
					<motion.div class="block block-4">
						<img src={image4} class="sepia" />
						<img src={image4} class="masked" />
					</motion.div>
					<motion.div class="block block-5">
						<img src={image5} class="sepia" />
						<img src={image5} class="masked" />
					</motion.div>
				</motion.div>

				<motion.div class="project-title-container">
					<motion.div class="title">
						<p>asterisks.</p>
					</motion.div>
					{/* <motion.div class="title" >
						<p>unlocked.</p>
					</motion.div>
					<motion.div class="title">
						<p>offbeat.</p>
					</motion.div>
					<motion.div class="title">
						<p>brutal.</p>
					</motion.div>
					<motion.div class="title">
						<p>mouthwash.</p>
					</motion.div> */}
				</motion.div>
			</StyledProject>
			<div class="project-footer">hold and drag</div>
		</StyledHomeProject>
	);
};

export default Project;
