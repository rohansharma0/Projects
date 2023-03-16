import gsap from "gsap";
import React, { useEffect, useRef } from "react";
import Logo from "./Logo";
import Menu from "./Menu";
import NavLinks from "./NavLinks";
import { StyledHeader } from "./styles/Header.styled";

const Header = () => {
	let header = useRef(null);

	useEffect(() => {
		//animation

		//FIXME: fix animation
		gsap.to(header, {
			scrollTrigger: {
				trigger: "#project",
				start: "top center",
				end: "+=100",
				scrub: true,
			},

			backgroundColor: "#1e1e1e",
		});
	});

	return (
		<StyledHeader ref={(el) => (header = el)}>
			<div class="nav">
				<Logo />
				<NavLinks />
			</div>
			<Menu />
		</StyledHeader>
	);
};

export default Header;
