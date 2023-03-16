import styled from "styled-components";

export const StyledMenu = styled.div`
	.menu {
		position: fixed;
		right: 1.5rem;
		border: none;
		background-color: transparent;
		z-index: 999;
		mix-blend-mode: difference;
		.menu-bar {
			width: 2.5rem;
			height: 1px;
			background-color: #fff;
			margin: 5px;
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		.menu {
			right: 2.5rem;
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
