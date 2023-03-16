import React, { useRef } from "react";
import { StyledHomeWork } from "./styles/Home.Work.styled";

const Work = () => {
	let workTexts = useRef(null);

	return (
		<StyledHomeWork ref={(el) => (workTexts = el)}>
			<div class="text-wrapper">
				<div class="top">
					<p class="line-inner">
						<span class="tag"></span>
						<span>What i do</span>
					</p>
				</div>
				<div class="middle">
					<p class="line-inner3">
						<span>I enjoy creating delightful,</span>
					</p>
					<p class="line-inner3">
						<span>human-centered digital experiences.</span>
					</p>
				</div>
				<div class="bottom">
					<p class="line-inner3">Think. Make.</p>
					<p class="line-inner3">
						<span>Solve.</span>
					</p>
				</div>
			</div>
			<div class="banner-wrapper"></div>
		</StyledHomeWork>
	);
};

export default Work;
