import React, { useEffect, useLayoutEffect, useRef, useState } from "react";
import { ProjectAnimation, SwipeBtnAnimation } from "../Helper/Animations";
import Gallery from "./Gallery";
import Slider from "./Project.Slider";
import { StyledHomeProject } from "./styles/Home.Project.styled";
import Marquee from "react-fast-marquee";

const Project = () => {
	let title = useRef(null);
	let holdandDrag = useRef(null);

	// const [width, setWidth] = useState(window.innerWidth);

	// useLayoutEffect(() => {
	// 	window.addEventListener("resize", () => setWidth(window.innerWidth));
	// }, [width]);

	useEffect(() => {
		// ProjectAnimation(title);
		// SwipeBtnAnimation(holdandDrag);
	});

	return (
		<StyledHomeProject id="project-section">
			{/* <div className="title-container">
				<div className="title">
					<p>
						PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-PROJECT-
					</p>
				</div>
			</div> */}
			<Marquee className="marquee-text" speed={100} gradient={false}>
				Selected Projects - Selected Projects - Selected Projects -
			</Marquee>
			{/* <div className="marquee-wrapper">
				<Marquee
					className="marquee-text-small"
					speed={100}
					gradient={false}
					direction={"right"}
				>
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects -
				</Marquee>

				
				<Marquee
					className="marquee-text-small"
					speed={100}
					gradient={false}
					direction={"right"}
				>
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects - Selected Projects - Selected Projects -
					Selected Projects -
				</Marquee>
			</div> */}

			<Gallery />
		</StyledHomeProject>
	);
};

export default Project;
