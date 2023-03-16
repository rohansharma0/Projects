import styled from "styled-components";

export const StyledHomeWork = styled.div`
	height: 100vh;
	display: flex;
	flex-direction: column;
	.text-wrapper {
		flex: 1;
		margin: 0 2rem;
		display: flex;
		flex-direction: column;
		justify-content: space-evenly;

		.top {
			p {
				color: #774dee;
				font-size: 1rem;
				font-weight: 600;
				display: flex;
				align-items: center;
				.tag {
					display: block;
					width: 16px;
					height: 2px;
					background-color: #774dee;
					margin-right: 0.5rem;
				}
				span {
					display: inline-block;
				}
			}
		}

		.line-inner3 {
			position: relative;
			overflow: hidden;

			span {
				display: inline-block;
			}
		}
		.middle {
			align-self: start;

			p {
				font-size: 1.3rem;
				line-height: 130%;
				font-weight: 600;
				color: #323232;
			}
		}

		.bottom {
			p {
				font-size: 4rem;
				font-weight: 800;
				line-height: 115%;
				color: #774dee;
				span {
					color: #323232;
				}
			}
		}
	}
	.banner-wrapper {
		flex: 1;
		background-color: #aaaaaa;
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
	}
`;
