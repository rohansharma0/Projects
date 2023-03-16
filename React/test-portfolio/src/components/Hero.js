import React, { useRef, useEffect } from "react";
import { StyledHomeHero } from "./styles/Home.Hero.styled";
import { HeroAnimation } from "../Helper/Animations";

const Hero = () => {
	let text1 = useRef(null);
	let text2 = useRef(null);
	let text3 = useRef(null);
	let text4 = useRef(null);
	let text5 = useRef(null);

	let resumeBtn = useRef(null);

	useEffect(() => {
		HeroAnimation(text1, text2, text3, text4, text5, resumeBtn);
	});
	return (
		<StyledHomeHero id="hero">
			<div class="top-hero">
				<h2 class="line-inner">
					<span class="hide-text" ref={(el) => (text1 = el)}>
						H<span>i,</span>
					</span>
				</h2>
			</div>
			<div class="middle-hero">
				<h2 class="line-inner">
					<span class="hide-text" ref={(el) => (text2 = el)}>
						I'm
					</span>
				</h2>
				<h2 class="line-inner">
					<span class="hide-text-1" ref={(el) => (text3 = el)}>
						Rohan<span>.</span>
					</span>
				</h2>
			</div>
			<div class="bottom-hero">
				<p class="line-inner-2" ref={(el) => (text4 = el)}>
					Creative frontend developer,
				</p>
				<p class="line-inner-2" ref={(el) => (text5 = el)}>
					designer and illustrator.
				</p>
			</div>
			<div class="resume-btn" ref={(el) => (resumeBtn = el)}>
				resume
			</div>
		</StyledHomeHero>
	);
};

export default Hero;
