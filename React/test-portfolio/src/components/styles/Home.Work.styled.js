import styled from "styled-components";

export const StyledHomeWork = styled.div`
	height: 100vh;
	display: flex;
	flex-direction: column;
	position: relative;
	.text-wrapper {
		flex: 1;
		margin: 0 2rem;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;

		.line-inner3 {
			position: relative;
			overflow: hidden;

			span {
				display: inline-block;
			}
		}
		.middle {
			align-self: start;
			display: flex;
			flex-direction: column;
			p {
				display: inline-block;
				font-size: 1.2rem;
				line-height: 130%;
				font-weight: 600;
				color: #323232;
			}
		}

		.bottom {
			.bottom-top {
				display: flex;
				flex-direction: row;
				flex-wrap: wrap;
				.line-inner4 {
					display: inline-block;
					margin-right: 2rem;
				}
			}
			p {
				display: inline-block;
				font-size: 5rem;
				font-weight: 800;
				line-height: 115%;

				.line-top {
					color: #774dee;
				}

				span {
					display: inline-block;
					color: #323232;
				}
			}
		}
	}
	.banner-wrapper {
		flex: 1;
		display: flex;
		justify-content: center;
		img {
			height: 100%;
			object-fit: cover;
			object-position: bottom;
			transform: scale(1.1);
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		.text-wrapper {
			margin: 0 4rem;

			.middle {
				p {
					font-size: 1.5rem;
				}
			}

			.bottom {
				p {
					font-size: 4.3rem;
				}
			}
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		.text-wrapper {
			margin: 0 6rem;
			.middle {
				p {
					font-size: 2rem;
				}
			}

			.bottom {
				p {
					font-size: 7rem;
				}
			}
		}
		.banner-wrapper {
			img {
				transform: scale(1.3);
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		flex-direction: row;

		.text-wrapper {
			margin: 5rem 0 5rem 14rem;

			.top {
				p {
					font-size: 1.2rem;
					.tag {
						width: 20px;
						height: 3px;
					}
				}
			}
		}

		.banner-wrapper {
			flex: 0;
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
		.text-wrapper {
			margin: 5rem 0 5rem 14rem;

			.top {
				p {
					font-size: 1.5rem;
					.tag {
						width: 30px;
						height: 3px;
						margin-right: 1rem;
					}
				}
			}

			.middle {
				p {
					font-size: 2.7rem;
				}
			}

			.bottom {
				p {
					font-size: 8.5rem;
				}
			}
		}
		.banner-wrapper {
			position: absolute;
			bottom: 0;
			top: 0;
			right: 0;
			img {
				transform: scale(1);
			}
		}
	}
`;
