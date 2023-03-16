import styled from "styled-components";

export const StyledNavLinks = styled.div`
	display: none;
	margin-left: 8rem;
	ul {
		display: flex;
		.nav-link {
			list-style: none;
			a {
				font-size: 18px;
				font-weight: 500;
				text-decoration: none;
				color: #323232;
				text-transform: capitalize;
				margin-right: 3rem;
			}

			.active {
				color: #774dee;
			}
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		display: block;
		margin-left: 12rem;
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
