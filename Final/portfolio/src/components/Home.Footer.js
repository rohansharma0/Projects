import React, { useEffect, useRef } from "react";
import { Link } from "react-router-dom";
import { footerAnimation } from "../Helper/Animations";
import { StyledHomeFooter } from "./styles/Home.Footer.styled";
import { useLocomotiveScroll } from "react-locomotive-scroll";

const Footer = () => {
	let text1 = useRef(null);
	let text2 = useRef(null);
	let text3 = useRef(null);

	let div1 = useRef(null);
	let div2 = useRef(null);
	let div3 = useRef(null);
	let div4 = useRef(null);

	const { scroll } = useLocomotiveScroll();

	useEffect(() => {
		// footerAnimation(logo, [text1, text2, text3], [div1, div2, div3, div4]);
	});

	useEffect(() => {
		let elements = document.querySelectorAll(".footer-rolling-text");

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
		<StyledHomeFooter id="footer-section">
			<div className="hero-section">
				<div className="top">
					<div>
						<p ref={(el) => (text1 = el)}>
							it’s time to stop scrolling.
						</p>
						<p ref={(el) => (text2 = el)}>
							let’s create something.
						</p>
					</div>
					<h3 ref={(el) => (text3 = el)}>get in touch.</h3>
				</div>
				<div className="bottom">
					<div className="bottom-container" ref={(el) => (div1 = el)}>
						<h4>explore.</h4>
						<Link to={"/"} className="clickableLinkShrink">
							<p>home</p>
						</Link>
						<Link to={"/about"} className="clickableLinkShrink">
							<p>about</p>
						</Link>
						<Link to={"/contact"} className="clickableLinkShrink">
							<p>contact</p>
						</Link>
					</div>

					<div className="bottom-container" ref={(el) => (div2 = el)}>
						<h4>social.</h4>
						<a
							href="https://www.instagram.com/rohan__sharma0/"
							target="_blank"
							className="clickableLinkShrink"
						>
							<p>instagram</p>
						</a>
						<a
							href="https://www.linkedin.com/in/rohan-sharma-bb34b1188"
							target="_blank"
							className="clickableLinkShrink"
						>
							<p>linkedin</p>
						</a>
						<a
							href="https://www.facebook.com/rohan.sharma.9903"
							target="_blank"
							className="clickableLinkShrink"
						>
							<p>facebook</p>
						</a>
					</div>
					<div className="bottom-container" ref={(el) => (div3 = el)}>
						<h4>contact.</h4>
						<a
							href="mailto:iamrohan29@gmail.com"
							className="clickableLinkShrink"
						>
							<p>iamrohan29@gmail.com</p>
						</a>
						<a
							href="tel:+91 7003260949"
							className="clickableLinkShrink"
						>
							<p>+91 700 326 0949</p>
						</a>
					</div>
					<div className="bottom-container" ref={(el) => (div4 = el)}>
						<h4>rohansharma.</h4>
						<p>kolkata</p>
						<p>west bengal</p>
						<p>712246</p>
					</div>
				</div>
			</div>
			<div className="footer">
				<div className="right">
					<a href="#" target="_blank">
						<p className="footer-rolling-text">privacy</p>
					</a>
					<a href="https://github.com/rohansharma0" target="_blank">
						<p className="footer-rolling-text">github</p>
					</a>
				</div>
				<div className="left">
					<div className="left-text">
						<p>made with</p>
						<div class="heart icon"></div>
						<p>by rohan</p>
					</div>
					<p>
						<span>©️</span> 2022 rohansharma.codes
					</p>
				</div>
				<div
					className="footer-arrow clickableLinkGlow"
					onClick={() => scroll.scrollTo(0)}
				>
					<div class="arrow-down icon"></div>
				</div>
			</div>
		</StyledHomeFooter>
	);
};

export default Footer;
