import styled from "styled-components";

export const StyledHomeHero = styled.div`
	height: 100vh;
	padding: 16vh 0;
	margin: 0 2rem;
	display: flex;
	flex-direction: column;

	.top-hero {
		h2.line-inner {
			margin: 1rem 0 1rem -5px;
			font-size: 6.5rem;
			font-weight: 800;
			color: #323232;
			line-height: 80%;
			.hide-text {
				display: inline-block;
				span {
					font-size: 3.8rem;
				}
			}
		}
	}

	.middle-hero {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		h2.line-inner {
			margin: 1rem 0 1rem -5px;
			font-size: 5.5rem;
			font-weight: 800;
			color: #774dee;
			line-height: 80%;
			.hide-text,
			.hide-text-1 {
				display: inline-block;
				span {
					color: #323232;
				}
			}

			.hide-text {
				margin-right: 2.5rem;
			}
		}
	}
	.bottom-hero {
		margin: 1rem 0;
		p {
			font-size: 1.2rem;
			font-weight: 300;
			line-height: 120%;
			color: #323232;
			margin: 0.2rem 0;
		}
	}
	//resume-btn

	.resume-btn {
		margin: 1rem 0;
		color: #fff;
		font-weight: 800;
		text-decoration: none;
		text-transform: uppercase;
		font-size: 25px;
		width: 13rem;
		height: 4rem;
		letter-spacing: 2px;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #323232;
		cursor: pointer;
		background-color: #323232;
	}

	.resume-btn:hover {
		color: #fff;
		background-color: #774dee;
		transition: 0.4s ease;
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		margin: 0 4rem;
		padding: 12vh 0;

		.top-hero {
			h2.line-inner {
				margin: 0.5rem 2rem 0.5rem -6px;
				font-size: 7.5rem;
				line-height: 100%;

				.hide-text {
					span {
						font-size: 4.4rem;
					}
				}
			}
		}
		.middle-hero {
			h2.line-inner {
				margin: 0.5rem 0 0.5rem -6px;
				font-size: 7.5rem;
				line-height: 90%;
			}
		}
		.bottom-hero {
			margin: 0.5rem 0;
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		margin: 0 6rem;
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
		margin: 0 14rem;
		padding: 18vh 0 10vh 0;
		justify-content: center;
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
				line-height: 90%;
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
				line-height: 90%;
				font-size: 10.5rem;

				margin-left: -9px;
			}
		}

		.bottom-hero {
			margin: 1rem 0;
			p {
				font-size: 1.4rem;
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
