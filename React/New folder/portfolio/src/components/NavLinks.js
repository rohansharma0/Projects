import React, { useEffect, useRef, useState } from "react";
import { useLocation } from "react-router-dom";

import { Link } from "react-router-dom";
import { NavAnimation } from "../Helper/Animations";
import { StyledNavLinks } from "./styles/NavLinks.styled";

const NavLinks = () => {
	//Nav Links Animation
	let navLinks = useRef(null);

	useEffect(() => {
		NavAnimation(navLinks);
	});

	//FIXME: change current tab
	//link change using url params
	let location = useLocation();

	const [currentTab, setCurrentTab] = useState(0);

	// useEffect(() => {
	// 	// "/" --> 0
	// 	// "about" --> 1
	// 	// "contact" --> 2

	// 	if (location.pathname === "/") {
	// 		setCurrentTab(0);
	// 	} else if (location.pathname === "/about") {
	// 		setCurrentTab(1);
	// 	} else if (location.pathname === "/contact") {
	// 		setCurrentTab(2);
	// 	}
	// });

	return (
		<StyledNavLinks ref={(el) => (navLinks = el)}>
			<ul>
				<li class="nav-link">
					<Link class={currentTab === 0 ? "active" : ""} to="/">
						projects
					</Link>
				</li>
				<li class="nav-link">
					<Link class={currentTab === 1 ? "active" : ""} to="/about">
						about
					</Link>
				</li>
				<li class="nav-link">
					<Link
						class={currentTab === 2 ? "active" : ""}
						to="/contact"
					>
						contact
					</Link>
				</li>
			</ul>
		</StyledNavLinks>
	);
};

export default NavLinks;
