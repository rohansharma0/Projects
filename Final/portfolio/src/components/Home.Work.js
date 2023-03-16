import React, { useEffect, useRef, useState } from "react";
import { WorkAnimation } from "../Helper/Animations";
import { StyledHomeWork } from "./styles/Home.Work.styled";
import Marquee from "react-fast-marquee";
const Work = () => {
	let title = useRef(null);
	let text1 = useRef(null);
	let text2 = useRef(null);
	let text3 = useRef(null);
	let text4 = useRef(null);

	useEffect(() => {
		// WorkAnimation(title, [text1, text2], [text3, text4]);
	});
	return (
		<StyledHomeWork id="work-wrapper">
			<Marquee className="marquee-text" speed={100} gradient={false}>
				Work - Work - Work - Work - Work - Work - Work - Work - Work -
			</Marquee>
			{/* <div className="marquee-wrapper">
				<Marquee
					className="marquee-text-small"
					speed={100}
					gradient={false}
					direction={"right"}
				>
					Work - Work - Work - Work - Work - Work - Work - Work - Work
					- Work - Work - Work - Work - Work - Work - Work - Work -
					Work - Work - Work - Work - Work - Work - Work - Work - Work
					- Work - Work
				</Marquee>

				<Marquee
					className="marquee-text-small"
					speed={100}
					gradient={false}
					direction={"right"}
				>
					Work - Work - Work - Work - Work - Work - Work - Work - Work
					- Work - Work - Work - Work - Work - Work - Work - Work -
					Work - Work - Work - Work - Work - Work - Work - Work - Work
					- Work - Work
				</Marquee>
			</div> */}
			<div className="work-section">
				<div className="top">
					<p>
						<span ref={(el) => (text1 = el)}>
							i enjoy creating delightful,
						</span>
					</p>
					<p>
						<span ref={(el) => (text2 = el)}>
							human-centered digital experiences.
						</span>
					</p>
				</div>
				<div className="middle">
					<p>
						<span ref={(el) => (text3 = el)}>think. make.</span>
					</p>
					<p>
						<span ref={(el) => (text4 = el)}>solve.</span>
					</p>
				</div>
				<div className="about-btn ">
					<a href="" className="clickableLinkGlow">
						About Me
						<span className="border"></span>
						<span className="border-hover1"></span>
						<span className="border-hover2"></span>
					</a>
				</div>
			</div>

			{/* <div className="footer">
				<p ref={(el) => (scrollBtn = el)}>scroll down</p>
			</div> */}
		</StyledHomeWork>
	);
};

export default Work;
