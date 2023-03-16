import React, { useEffect, useRef } from "react";
import { StyledCursor } from "../components/styles/Cursor.styled";

const Cursor = () => {
	let cursorRef = useRef(null);

	useEffect(() => {
		let details = navigator.userAgent;

		/* Creating a regular expression
		containing some mobile devices keywords
		to search it in details string*/
		let regexp = /android|iphone|kindle|ipad/i;

		/* Using test() method to search regexp in details
		it returns boolean value*/
		let isMobileDevice = regexp.test(details);

		if (isMobileDevice) {
			cursorRef.current.style.display = "none";
		} else {
			cursorRef.current.style.display = "block";
		}
	}, []);

	useEffect(() => {
		document.addEventListener("mouseenter", () => {
			cursorRef.current.style.opacity = "1";
		});
		document.addEventListener("mouseleave", () => {
			cursorRef.current.style.opacity = "0";
		});
	});

	useEffect(() => {
		let clickableLinkGlow = document.querySelectorAll(".clickableLinkGlow");
		let clickableLinkShrink = document.querySelectorAll(
			".clickableLinkShrink",
		);
		clickableLinkGlow.forEach((link) => {
			link.addEventListener("mouseover", () => {
				cursorRef.current.classList.add("clickableLink-grow");
			});
			link.addEventListener("mouseleave", () => {
				cursorRef.current.classList.remove("clickableLink-grow");
			});
		});

		clickableLinkShrink.forEach((link) => {
			link.addEventListener("mouseover", () => {
				cursorRef.current.classList.add("clickableLink-shrink");
			});
			link.addEventListener("mouseleave", () => {
				cursorRef.current.classList.remove("clickableLink-shrink");
			});
		});
	});

	useEffect(() => {
		document.addEventListener("mousemove", (event) => {
			const { clientX, clientY } = event;

			let mouseX = clientX - cursorRef.current.clientWidth / 2;

			let mouseY = clientY - cursorRef.current.clientHeight / 2;

			cursorRef.current.style.top = mouseY + "px";
			cursorRef.current.style.left = mouseX + "px";

			// cursorRef.current.style.transform = `translate3d(${mouseX}px , ${mouseY}px , 0) scale(1)`;
		});
	}, []);

	return (
		<StyledCursor>
			<div className="app-cursor" ref={cursorRef}></div>
		</StyledCursor>
	);
};

export default Cursor;
