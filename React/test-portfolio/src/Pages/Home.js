import React, { useRef } from "react";
import Hero from "../components/Hero";
import Project from "../components/Project";
import { StyledHome } from "../components/styles/Home.styled";
import Work from "../components/Work";

const Home = () => {
	return (
		<StyledHome>
			<Hero />
			<Work />
			<Project />
		</StyledHome>
	);
};

export default Home;
