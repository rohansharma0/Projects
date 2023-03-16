import styled from "styled-components";

export const StyledHamburger = styled.div`
	display: none;
	z-index: 9;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	position: fixed;
	width: 100%;
	height: 100%;

	.menu-secondary-bg-color {
		background-color: #323232;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		position: fixed;
		width: 100%;
		height: 100%;
		z-index: -1;
	}
	.container {
		position: relative;
		background-color: #774dee;
		height: 100%;
		overflow: hidden;

		display: grid;
		grid-template-columns: repeat(6, 1fr);

		.menu-links {
			grid-column: 2;
			height: 100vh;
			display: flex;
			align-items: center;
			ul {
				display: block;
				li {
					list-style: none;
					font-size: 3.5rem;
					cursor: pointer;
					font-weight: 700;
					overflow: hidden;
					position: relative;
					text-transform: capitalize;
					margin: 1rem 0;
					a {
						color: #fff;
						text-decoration: none;
						display: block;
						&:hover {
							color: #323232;
						}
					}
					.active {
						color: #323232;
					}
				}
			}
		}
	}
	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		.container {
			.menu-links {
				ul {
					li {
						font-size: 6rem;
					}
				}
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
