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
	.showHide {
		opacity: 0;
	}

	.menu-secondary-bg-color {
		background-color: #fff;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		position: fixed;
		width: 100%;
		height: 100%;
		z-index: -1;
		mix-blend-mode: difference;
	}

	.footer {
		position: absolute;
		bottom: 0;
		width: 100%;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
		padding: 0 2.5rem;
		height: 15vh;
		.footer-links {
			display: flex;
			align-items: center;

			a {
				align-items: center;
				display: flex;
				margin: 0 1rem 0 0;

				.rolling-text {
					font-size: 1rem;
					letter-spacing: 0.5px;
					color: #fff;
					margin: 0.25rem 0;
					margin-right: 1rem;
					overflow: hidden;
					height: 1rem;
				}

				.rolling-text:hover .letter,
				.rolling-text.play .letter {
					transform: translateY(-100%);
				}

				.rolling-text .block:last-child {
					color: #fff;
				}

				.rolling-text .letter {
					display: inline-block;
					transition: transform 0.6s cubic-bezier(0.76, 0, 0.24, 1);
				}

				.letter:nth-child(1) {
					transition-delay: 0s;
				}

				.letter:nth-child(2) {
					transition-delay: 0.015s;
				}

				.letter:nth-child(3) {
					transition-delay: 0.03s;
				}

				.letter:nth-child(4) {
					transition-delay: 0.045s;
				}

				.letter:nth-child(5) {
					transition-delay: 0.06s;
				}

				.letter:nth-child(6) {
					transition-delay: 0.075s;
				}

				.letter:nth-child(7) {
					transition-delay: 0.09s;
				}

				.letter:nth-child(8) {
					transition-delay: 0.105s;
				}

				.letter:nth-child(9) {
					transition-delay: 0.12s;
				}

				img {
					width: 1.2rem;
				}
			}
		}
		.copyright {
			font-size: 1rem;
			letter-spacing: 0.5px;
			p {
				color: #fff;
				margin: 0.25rem 0;
				margin-right: 1rem;
				span {
					font-size: 80%;
				}
			}
		}
	}
	.container {
		position: relative;
		background-color: #000;
		height: 100%;
		width: 100%;
		display: flex;
		align-items: center;
		overflow: hidden;

		.logo-container {
			height: 16vh;
			display: flex;
			justify-content: flex-start;
			align-items: center;
			margin: 0 6vw;
		}

		.menu-links {
			margin: 0 0 0 2.5rem;
			width: fit-content;
			ul {
				display: block;
				li {
					list-style: none;
					font-size: 3.5rem;
					width: fit-content;
					overflow: hidden;
					position: relative;

					margin: 1rem 0;
					a {
						text-decoration: none;
						display: block;

						&:hover span::before {
							width: 100%;
						}

						span {
							position: relative;
							white-space: nowrap;
							text-transform: uppercase;
							letter-spacing: 8px;
							-webkit-text-stroke-width: 1px;
							-webkit-text-stroke-color: #fff;
							color: #000;

							&::before {
								content: attr(data-text);
								overflow: hidden;
								width: 0;
								position: absolute;
								left: 0;
								top: 50%;
								z-index: 2;
								color: #fff;
								transform: translateY(-50%);
								transition: 1s
									cubic-bezier(0.225, 1, 0.316, 0.99);
							}
						}
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
						font-size: 4.5rem;
					}
				}
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		.container {
			.menu-links {
				margin: 0 0 0 12vw;
				ul {
					li {
						font-size: 6rem;
					}
				}
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
