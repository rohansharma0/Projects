import styled from "styled-components";

export const StyledLogo = styled.div`
	a {
		display: block;
	}
	.logo {
		fill: #323232;
		width: 100px;
		height: auto;
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		.logo {
			width: 120px;
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		.logo {
			width: 140px;
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
