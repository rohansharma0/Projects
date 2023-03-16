import styled from "styled-components";

export const StyledHomeHero = styled.div`
	height: 65vh;
	display: flex;
	flex-direction: column;
	justify-content: end;

	.top-hero {
		h2.line-inner {
			font-size: 6.5rem;
			font-weight: 800;
			color: #323232;
			margin-left: -5px;
			.hide-text {
				display: inline-block;
				span {
					font-size: 3.8rem;
				}
			}
		}
	}

	.middle-hero {
		h2.line-inner {
			font-size: 5.5rem;
			font-weight: 800;
			color: #774dee;
			margin-left: -5px;
			.hide-text {
				display: inline-block;
				span {
					color: #323232;
				}
			}
		}
	}
	.bottom-hero {
		padding: 0 0 3rem 0;
		p {
			font-size: 1.2rem;
			font-weight: 200;
			color: #323232;
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		.top-hero {
			h2.line-inner {
				font-size: 7.5rem;
				line-height: 120%;
				margin-left: -6px;
				.hide-text {
					span {
						font-size: 4.4rem;
					}
				}
			}
		}
		.middle-hero {
			h2.line-inner {
				font-size: 7.5rem;
				line-height: 120%;
				margin-left: -6px;
			}
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		height: 55vh;
		.top-hero {
			h2.line-inner {
				font-size: 9rem;
				margin-left: -8px;
				.hide-text {
					span {
						font-size: 5.4rem;
					}
				}
			}
		}
		.middle-hero {
			h2.line-inner {
				font-size: 9rem;
				margin-left: -8px;
			}
		}

		.bottom-hero {
			p {
				font-size: 1.3rem;
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		.top-hero {
			h2.line-inner {
				font-size: 8.5rem;
				margin-left: -9px;
				.hide-text {
					span {
						font-size: 4.5rem;
					}
				}
			}
		}

		.middle-hero {
			h2.line-inner {
				font-size: 8.5rem;

				margin-left: -9px;
			}
		}

		.bottom-hero {
			p {
				font-size: 1.4rem;
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1400px) {
		.top-hero {
			h2.line-inner {
				font-size: 10.5rem;

				margin-left: -9px;
				.hide-text {
					span {
						font-size: 6rem;
					}
				}
			}
		}

		.middle-hero {
			h2.line-inner {
				font-size: 10.5rem;

				margin-left: -9px;
			}
		}

		.bottom-hero {
			p {
				font-size: 1.4rem;
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
