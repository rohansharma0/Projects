import locomotiveScroll from "locomotive-scroll";
import { useEffect } from "react";

// import "../static/css/locomotiveScroll.css";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

export default function useLocoScroll(start) {
	useEffect(() => {
		if (!start) return;

		let locoScroll = new locomotiveScroll({
			el: document.querySelector("#wrapper"),
			smooth: true,
			lerp: 0.08,
			tablet: {
				smooth: false,
				breakpoint: 1024,
			},
			smartphone: {
				smooth: false,
			},
		});

		locoScroll.on("scroll", ScrollTrigger.update);
		// tell ScrollTrigger to use these proxy methods for the ".smooth-scroll" element since Locomotive Scroll is hijacking things
		ScrollTrigger.scrollerProxy("#wrapper", {
			scrollTop(value) {
				return arguments.length
					? locoScroll.scrollTo(value, 0, 0)
					: locoScroll.scroll.instance.scroll.y;
			}, // we don't have to define a scrollLeft because we're only scrolling vertically.
			getBoundingClientRect() {
				return {
					top: 0,
					left: 0,
					width: window.innerWidth,
					height: window.innerHeight,
				};
			},
			// LocomotiveScroll handles things completely differently on mobile devices - it doesn't even transform the container at all! So to get the correct behavior and avoid jitters, we should pin things with position: fixed on mobile. We sense it by checking to see if there's a transform applied to the container (the LocomotiveScroll-controlled element).
			pinType: document.querySelector("#wrapper").style.transform
				? "transform"
				: "fixed",
		});

		ScrollTrigger.addEventListener("refresh", () => locoScroll.update());
		ScrollTrigger.refresh();

		return () => {
			if (locoScroll) {
				ScrollTrigger.removeEventListener(
					"refresh",
					locoScroll.update(),
				);
				locoScroll.destroy();
				locoScroll = null;
			}
		};
	}, [start]);
}
