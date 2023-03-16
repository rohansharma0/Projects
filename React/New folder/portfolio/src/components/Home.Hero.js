import React, { useEffect, useRef } from "react";
import { StyledHomeHero } from "./styles/Home.Hero.styled";

//Animations
import { ScrollDownAnimation, HeroAnimation } from "../Helper/Animations";

const Hero = () => {
	let scrollDown = useRef(null);
	let text = useRef(null);
	let secondaryText = useRef(null);
	let resumeBtn = useRef(null);

	useEffect(() => {
		//hero section
		const text1 = text.children[0].firstChild.firstChild;
		const text2 = text.children[1].firstChild.firstChild;

		const secondaryText1 = secondaryText.children[0];
		const secondaryText2 = secondaryText.children[1];

		//FIXME: Text animation

		// ScrollDownAnimation(scrollDown);
		// HeroAnimation(text1, text2, secondaryText1, secondaryText2, resumeBtn);
	});

	return (
		<>
			<StyledHomeHero ref={(el) => (text = el)}>
				<div class="top-hero">
					<h2 class="line-inner">
						<span class="hide-text">
							H<span>i,</span>
						</span>
					</h2>
				</div>
				<div class="middle-hero">
					<h2 class="line-inner">
						<span class="hide-text">
							I'm Rohan<span>.</span>
						</span>
					</h2>
				</div>
				<div class="bottom-hero" ref={(el) => (secondaryText = el)}>
					<p class="line-inner-2">Creative frontend developer,</p>
					<p class="line-inner-2">designer and illustrator.</p>
				</div>
			</StyledHomeHero>
			<div class="hero-footer">
				<div class="resume-btn" ref={(el) => (resumeBtn = el)}>
					resume
				</div>

				<div class="scroll-down" ref={(el) => (scrollDown = el)}>
					Scroll Down
				</div>
			</div>
		</>
	);
};

export default Hero;
