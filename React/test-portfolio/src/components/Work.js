import React, { useEffect, useRef } from "react";
import { StyledHomeWork } from "./styles/Home.Work.styled";
import logo from "../static/images/work.png";
import { WorkAnimation } from "../Helper/Animations";

const Work = () => {
	let text1 = useRef(null);
	let text2 = useRef(null);
	let text3 = useRef(null);
	let text4 = useRef(null);
	let text5 = useRef(null);

	useEffect(() => {
		WorkAnimation(text1, text2, text3, text4, text5);
	});

	return (
		<StyledHomeWork id="work">
			<div class="text-wrapper">
				<div class="middle">
					<p class="line-inner3">
						<span ref={(el) => (text1 = el)}>
							I enjoy creating delightful,
						</span>
					</p>
					<p class="line-inner3">
						<span ref={(el) => (text2 = el)}>
							human-centered digital experiences.
						</span>
					</p>
				</div>
				<div class="bottom">
					<div class="bottom-top">
						<p class="line-inner4">
							<span class="line-top" ref={(el) => (text3 = el)}>
								Think.
							</span>
						</p>
						<p class="line-inner3">
							<span class="line-top" ref={(el) => (text4 = el)}>
								Make.
							</span>
						</p>
					</div>

					<p class="line-inner3">
						<span ref={(el) => (text5 = el)}>Solve.</span>
					</p>
				</div>
			</div>
			<div class="banner-wrapper">
				<img src={logo} />
			</div>
		</StyledHomeWork>
	);
};

export default Work;
