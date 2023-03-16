import React, { useEffect, useState } from "react";
import { useLocation, withRouter } from "react-router-dom";
import Hamburger from "./Hamburger";
import { StyledMenu } from "./styles/Menu.styled";

const Menu = ({ history }) => {
	//url history

	//url location
	let location = useLocation();

	//state for menu hide on larger devices
	const [isActive, setIsActive] = useState(true);
	const [width, setWidth] = useState(window.innerWidth);

	//state for menu toggle
	const [isMenuOn, setIsMenuOn] = useState({
		initial: false,
		clicked: null,
	});

	//state for disabled button
	const [disabled, setDisabled] = useState(false);

	//use effect for handle menu hiding
	useEffect(() => {
		window.addEventListener("resize", () => setWidth(window.innerWidth));
		if (
			width >= 1200 &&
			(location.pathname === "/about" || location.pathname === "/contact")
		) {
			setIsActive(false);
		} else {
			setIsActive(true);
		}
	}, [location, isActive, width]);

	//use effect for page changes

	useEffect(() => {
		history.listen(() => {
			setIsMenuOn({ clicked: false });
		});
		// MenuRevelAnimation(menu);
	});

	//handle menu button
	const handleMenu = () => {
		//disable menu btn for spam
		disabledMenu();
		if (isMenuOn.initial === false) {
			//1st time clicked
			setIsMenuOn({
				initial: null,
				clicked: true,
			});
		} else if (isMenuOn.clicked === true) {
			//menu is already on
			setIsMenuOn({
				clicked: !isMenuOn.clicked,
			});
		} else if (isMenuOn.clicked === false) {
			//menu is already off
			setIsMenuOn({
				clicked: !isMenuOn.clicked,
			});
		}
	};

	//handle disable menu btn for spam
	const disabledMenu = () => {
		setDisabled(!disabled);
		setTimeout(() => {
			setDisabled(false);
		}, 1000);
	};

	return (
		//TODO: menu bar changes animation
		<div style={{ display: isActive ? "flex" : "none" }}>
			<StyledMenu>
				<button class="menu" onClick={handleMenu} disabled={disabled}>
					<div class="menu-bar"></div>
					<div class="menu-bar"></div>
					<div class="menu-bar"></div>
				</button>
			</StyledMenu>
			<Hamburger isActive={isMenuOn} />
		</div>
	);
};

export default withRouter(Menu);
