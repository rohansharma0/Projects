import React from "react";

import img1 from "../static/img/img-one.jpeg";
import img2 from "../static/img/img-two.jpeg";
import img3 from "../static/img/img-three.jpeg";
import img4 from "../static/img/img-four.jpeg";
import img5 from "../static/img/img-five.jpeg";
import { StyledGallery } from "./styles/Gallery.styled";

const Gallery = () => {
	let data = [
		{
			id: 1,
			title: "Egatan",
			desc: "Development for a coworking space located in Gothenburg, Sweden that houses creatives and entrepreneurs.",
			imageUrl: img1,
		},
		{
			id: 2,
			title: "Egatan",
			desc: "Development for a coworking space located in Gothenburg, Sweden that houses creatives and entrepreneurs.",
			imageUrl: img2,
		},
		{
			id: 3,
			title: "Egatan",
			desc: "Development for a coworking space located in Gothenburg, Sweden that houses creatives and entrepreneurs.",
			imageUrl: img3,
		},
		{
			id: 4,
			title: "Egatan",
			desc: "Development for a coworking space located in Gothenburg, Sweden that houses creatives and entrepreneurs.",
			imageUrl: img4,
		},
	];

	return (
		<StyledGallery>
			{data.map((proj, i) => (
				<div
					key={proj.id}
					className={
						i % 2 === 0
							? "project-container"
							: "project-container-reverse"
					}
				>
					<img src={proj.imageUrl} />

					<div className="desc-container">
						<p className="title">{proj.title}</p>
						<p className="desc">{proj.desc}</p>
						<div className="project-btn clickableLinkGlow">
							<div className="circle">
								<div class="arrow-right icon"></div>
							</div>
							<p className="btn-text">View Project</p>
						</div>
					</div>
				</div>
			))}
		</StyledGallery>
	);
};

export default Gallery;
