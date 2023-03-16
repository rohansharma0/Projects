import styled from "styled-components";

export const StyledGallery = styled.div`
	width: calc(100% - 3rem);
	margin: 0 1.5rem;

	.project-container,
	.project-container-reverse {
		margin: 3rem 0;
		display: flex;
		flex-direction: column;
		justify-content: center;
		img {
			height: 55vh;
			width: 100%;
			object-fit: cover;
		}
		.desc-container {
			display: flex;
			flex-direction: column;
			justify-content: center;
			p.desc {
				color: #0c0c0d;
				font-size: 1.1rem;
			}
			.project-btn {
				display: flex;
				flex-direction: row;
				align-items: center;
				margin: 1rem 0;

				&:hover .btn-text::after {
					width: 100%;
				}

				.btn-text {
					text-transform: uppercase;
					color: black;
					font-size: 1.1rem;
					letter-spacing: 1px;
					margin-left: 1rem;
					position: relative;

					&::after {
						content: "";
						position: absolute;
						bottom: 0;
						left: 0;
						width: 0%;
						height: 2px;
						background: #0c0c0d;
						transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
					}
				}

				.circle {
					height: 2.5rem;
					width: 2.5rem;
					border: 1px solid #2e2e2e;
					border-radius: 50%;
					display: flex;
					justify-content: center;
					align-items: center;
					.arrow-right.icon {
						color: #000;
						position: absolute;
						width: 12px;
						height: 1px;
						background-color: currentColor;
					}

					.arrow-right.icon:before {
						content: "";
						position: absolute;
						right: 1px;
						top: -4px;
						width: 8px;
						height: 8px;
						border-top: solid 1px currentColor;
						border-right: solid 1px currentColor;
						-webkit-transform: rotate(45deg);
						transform: rotate(45deg);
					}
				}
			}
		}
		p.title {
			font-size: 3rem;
			color: #0c0c0d;
			margin-top: 0.7rem;
			text-transform: uppercase;
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		width: calc(100% - 10rem);
		margin: 0 5rem;
	}

	@media only screen and (min-width: 800px) {
		/* width: calc(100% - 20rem);
		margin: 0 10rem; */

		.project-container {
			margin: 6rem 0;
			display: flex;

			justify-content: center;
			flex-direction: row;
			img {
				height: 65vh;
				width: 50%;
			}
			p.title {
				font-size: 6rem;
				color: #fff;
				mix-blend-mode: difference;
				margin: 0;
				transform: translate3d(-15vw, 0, 0);
			}
			.desc-container {
				align-items: flex-start;
				width: 50%;
				justify-content: center;
				padding-left: 2rem;
				padding-right: 0rem;

				p.desc {
					font-size: 1.5rem;
				}
				.project-btn {
					margin: 1.6rem 0;

					&:hover .btn-text::after {
						width: 100%;
					}

					.btn-text {
						font-size: 1.2rem;
					}

					.circle {
						height: 3rem;
						width: 3rem;

						.arrow-right.icon {
							width: 14px;
						}

						.arrow-right.icon::before {
							top: -5px;
							width: 10px;
							height: 10px;
						}
					}
				}
			}
		}
		.project-container-reverse {
			margin: 6rem 0;
			display: flex;

			justify-content: center;
			flex-direction: row-reverse;

			img {
				height: 65vh;
				width: 50%;
			}
			p.title {
				font-size: 6rem;
				color: #fff;
				mix-blend-mode: difference;
				margin: 0;
				transform: translate3d(17vw, 0, 0);
			}
			.desc-container {
				align-items: flex-end;
				width: 50%;
				justify-content: center;
				padding-left: 0rem;
				padding-right: 2rem;

				p.desc {
					font-size: 1.5rem;
					text-align: right;
				}
				.project-btn {
					margin: 1.6rem 0;

					&:hover .btn-text::after {
						width: 100%;
					}

					.btn-text {
						font-size: 1.2rem;
					}

					.circle {
						height: 3rem;
						width: 3rem;

						.arrow-right.icon {
							width: 14px;
						}

						.arrow-right.icon::before {
							top: -5px;
							width: 10px;
							height: 10px;
						}
					}
				}
			}
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		width: calc(100% - 20rem);
		margin: 0 10rem;

		.project-container {
			p.title {
				transform: translate3d(-12vw, 0, 0);
			}
		}
		.project-container-reverse {
			p.title {
				transform: translate3d(13vw, 0, 0);
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		width: calc(100% - 20vw);
		margin: 0 10vw;

		.project-container {
			margin: 8rem 0;
			img {
				height: 80vh;
			}
			p.title {
				font-size: 8rem;
				transform: translate3d(-12vw, 0, 0);
			}
			.desc-container {
				padding-right: 9rem;
				padding-left: 3rem;
				p.desc {
					font-size: 1.6rem;
				}
				.project-btn {
					margin: 2rem 0;

					&:hover .btn-text::after {
						width: 100%;
					}

					.btn-text {
						font-size: 1.4rem;
					}

					.circle {
						height: 3rem;
						width: 3rem;
					}
				}
			}
		}
		.project-container-reverse {
			margin: 8rem 0;

			img {
				height: 80vh;
			}
			p.title {
				font-size: 8rem;
				transform: translate3d(13vw, 0, 0);
			}
			.desc-container {
				padding-left: 9rem;
				padding-right: 3rem;
				p.desc {
					font-size: 1.6rem;
				}
				.project-btn {
					margin: 2rem 0;

					&:hover .btn-text::after {
						width: 100%;
					}

					.btn-text {
						font-size: 1.4rem;
					}

					.circle {
						height: 3rem;
						width: 3rem;
					}
				}
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1700px) {
		width: calc(100% - 32vw);
		margin: 0 16vw;

		.project-container {
			margin: 10rem 0;
			img {
				height: 85vh;
			}
			p.title {
				font-size: 9rem;
				transform: translate3d(-10vw, 0, 0);
			}
			.desc-container {
				padding-right: 16rem;
				padding-left: 3rem;
				p.desc {
					font-size: 1.8rem;
				}
				.project-btn {
					margin: 2rem 0;

					&:hover .btn-text::after {
						width: 100%;
					}

					.btn-text {
						font-size: 1.8rem;
					}

					.circle {
						height: 3.5rem;
						width: 3.5rem;
					}
				}
			}
		}
		.project-container-reverse {
			margin: 10rem 0;

			img {
				height: 85vh;
			}
			p.title {
				font-size: 9rem;
				transform: translate3d(11vw, 0, 0);
			}
			.desc-container {
				padding-left: 16rem;
				padding-right: 3rem;
				p.desc {
					font-size: 1.8rem;
				}
				.project-btn {
					margin: 2rem 0;

					&:hover .btn-text::after {
						width: 100%;
					}

					.btn-text {
						font-size: 1.8rem;
					}

					.circle {
						height: 3.5rem;
						width: 3.5rem;
					}
				}
			}
		}
	}
`;
