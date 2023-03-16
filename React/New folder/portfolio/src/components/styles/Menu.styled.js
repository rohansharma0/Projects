import styled from "styled-components";

export const StyledMenu = styled.div`
	z-index: 10;
	display: inline-flex;
	align-items: center;
	justify-content: center;

	.menu {
		cursor: pointer;
		border: none;
		background-color: transparent;
		.menu-bar {
			width: 25px;
			height: 3px;
			border-radius: 2px;
			margin: 5px 0;
			background-color: #323232;
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		.menu {
			.menu-bar {
				width: 30px;
				height: 4px;
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		position: fixed;
		width: 14rem;
		height: 100%;
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
