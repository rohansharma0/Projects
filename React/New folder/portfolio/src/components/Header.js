import React from "react";
import Logo from "./Logo";
import Menu from "./Menu";
import NavLinks from "./NavLinks";
import { StyledHeader } from "./styles/Header.styled";

const Header = () => {
	return (
		<StyledHeader>
			<div class="nav">
				<Logo />
				<NavLinks />
			</div>

			<Menu />
		</StyledHeader>
	);
};

export default Header;
