import React, { useRef } from "react";
import Hero from "../components/Home.Hero";
import Project from "../components/Home.Project";
import Work from "../components/Home.Work";
import { StyledHome } from "../components/styles/Home.styled";

const Home = () => {
	return (
		<>
			<StyledHome>
				<Hero />
			</StyledHome>
			<Work />
			<Project />
		</>
	);
};

export default Home;
