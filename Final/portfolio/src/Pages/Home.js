import React, { useRef } from "react";
import Footer from "../components/Home.Footer";
import Hero from "../components/Home.Hero";
import Project from "../components/Home.Project";
import Work from "../components/Home.Work";

import { LocomotiveScrollProvider } from "react-locomotive-scroll";

const Home = () => {
	const containerRef = useRef(null);

	return (
		<LocomotiveScrollProvider
			options={{
				smooth: true,
				reloadOnContextChange: true,
				// ... all available Locomotive Scroll instance options
			}}
			watch={
				[
					//...all the dependencies you want to watch to update the scroll EXCEPT the location one
				]
			}
		>
			<main data-scroll-container ref={containerRef}>
				<Hero />
				<Project />
				<Work />
				<Footer />
			</main>
		</LocomotiveScrollProvider>
	);
};

export default Home;
