import React from "react";
import Logo from "./Logo";
import Menu from "./Menu";
import { StyledNavBar } from "./styles/NavBar.styled";

const NavBar = () => {
	return (
		<StyledNavBar>
			<div className="logo-container clickableLinkGlow">rohan</div>
			<Menu />
		</StyledNavBar>
	);
};

export default NavBar;
