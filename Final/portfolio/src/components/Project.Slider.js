import React, { useEffect, useRef, useState, useLayoutEffect } from "react";

import { motion } from "framer-motion";
import img1 from "../static/img/img-one.jpeg";
import img2 from "../static/img/img-two.jpeg";
import img3 from "../static/img/img-three.jpeg";
import img4 from "../static/img/img-four.jpeg";
import img5 from "../static/img/img-five.jpeg";
import { StyledProjectSlider } from "./styles/Project.Slider.styled";
import gsap from "gsap";

const unsplashUrls = [
	"https://images.unsplash.com/photo-1529971071135-c1982792bb96?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80",
	"https://images.unsplash.com/photo-1594780841377-e05e12d0d1ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80",
	"https://images.unsplash.com/photo-1591251436930-a1e858c633a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1301&q=80",
	"https://images.unsplash.com/photo-1564109799258-6b7c25cd1c92?ixlib=rb-1.2.1&auto=format&fit=crop&w=1301&q=80",
	"https://images.unsplash.com/photo-1552793084-49132af00ff1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1301&q=80",
	"https://images.unsplash.com/photo-1548918901-9b31223c5c3a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1301&q=80",
];

const title = [
	"asterisks-1",
	"asterisks-2",
	"asterisks-3",
	"asterisks-4",
	"asterisks-5",
	"asterisks-6",
];

const images = [img1, img2, img3, img4, img5];

const Slider = () => {
	const [carouselWidth, setCarouselWidth] = useState(0);
	const carousel = useRef();

	const [width, setWidth] = useState(window.innerWidth);

	useLayoutEffect(() => {
		window.addEventListener("resize", () => setWidth(window.innerWidth));
	}, [width]);

	useEffect(() => {
		let leftMar = 0;
		if (width >= 1200) {
			leftMar = 0.3 * width;
		} else {
			leftMar = 0.15 * width;
		}
		setCarouselWidth(
			carousel.current.scrollWidth -
				carousel.current.offsetWidth +
				leftMar,
		);
	}, []);
	const [skewAnimation, setSkewAnimation] = useState(2);
	const [currentSlide, setCurrentSlide] = useState(0);

	// const slider = React.useRef();
	// const otherRef = React.useRef({
	// 	hasMousePress: false,
	// 	startXPosition: 0,
	// 	transformAmount: 0,
	// 	velocity: 0,
	// 	requestAnimationId: 0,
	// });
	// const mouseDown = (event) => {
	// 	otherRef.current.hasMousePress = true;
	// 	otherRef.current.startXPosition =
	// 		event.pageX - otherRef.current.transformAmount;
	// 	// cancelMomentumTracking();
	// };
	// const mouseLeave = () => {
	// 	otherRef.current.hasMousePress = false;
	// };
	// const mouseUp = () => {
	// 	otherRef.current.hasMousePress = false;
	// 	// beginMomentumTracking();
	// };

	// const mouseMove = (event) => {
	// 	if (!otherRef.current.hasMousePress) return;
	// 	const { pageX } = event;
	// 	const distance = pageX - otherRef.current.startXPosition;
	// 	const clampedDistance = clamp(
	// 		distance,
	// 		-slider.current.scrollWidth + slider.current.clientWidth,
	// 		0,
	// 	);
	// 	otherRef.current.velocity =
	// 		otherRef.current.transformAmount - clampedDistance;
	// 	otherRef.current.transformAmount = clampedDistance;
	// 	console.log(clampedDistance);
	// 	slider.current.style.transform = `translate3d(${clampedDistance}px, -50%, 0px)`;
	// };

	// useEffect(() => {
	// 	const sliderCopy = slider.current;
	// 	sliderCopy.addEventListener("mousedown", mouseDown);
	// 	sliderCopy.addEventListener("mouseleave", mouseLeave);
	// 	sliderCopy.addEventListener("mouseup", mouseUp);
	// 	sliderCopy.addEventListener("mousemove", mouseMove);

	// 	return () => {
	// 		sliderCopy.removeEventListener("mousedown", mouseDown);
	// 		sliderCopy.removeEventListener("mouseleave", mouseLeave);
	// 		sliderCopy.removeEventListener("mouseup", mouseUp);
	// 		sliderCopy.removeEventListener("mousemove", mouseMove);
	// 	};
	// }, []);

	const info1 = useRef();
	const info2 = useRef();

	const hideInfo = () => {
		if (info1 != null && info2 != null) {
			gsap.to([info1.current, info2.current], {
				opacity: 0,
				duration: 0.2,
				ease: "easeInOut",
			});
		}
	};

	const showInfo = () => {
		if (info1 != null && info2 != null) {
			gsap.to([info1.current, info2.current], {
				opacity: 1,
				duration: 0.2,
				ease: "easeInOut",
			});
		}
	};

	return (
		<StyledProjectSlider>
			<motion.div
				ref={carousel}
				className="slider-container"
				whileTap={{ cursor: "grabbing" }}
			>
				<motion.div
					drag="x"
					dragConstraints={{ right: 0, left: -carouselWidth }}
					className="slider-images"
					whileDrag={{ skewX: skewAnimation }}
					onDragStart={(event, info) => {
						hideInfo();
					}}
					onDragEnd={(event, info) => {
						showInfo();
					}}
					onDrag={(event, info) => {
						// hideInfo();
						if (info.offset.x > 0) {
							setSkewAnimation(5);
						} else {
							setSkewAnimation(-5);
						}
					}}
				>
					{images.map((image, i) => (
						<motion.div
							className="image-wrapper"
							whileHover={{
								scale: 1.15,
							}}
							key={i}
						>
							<img src={image} class="sepia" alt="img" />
						</motion.div>
					))}
				</motion.div>
			</motion.div>

			<div class="project-info" ref={info1}>
				<div class="info">
					<li>01</li>
					<p>UI Wire-framing</p>
					<p>UI Designs</p>
					<p>FE Development</p>
				</div>
			</div>

			<div class="project-title-container" ref={info2}>
				<div class="project-title">
					<p>{title[currentSlide]}</p>
				</div>
			</div>
		</StyledProjectSlider>
	);
};

export default Slider;
