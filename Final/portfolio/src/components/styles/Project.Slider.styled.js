import styled from "styled-components";

export const StyledProjectSlider = styled.div`
	position: relative;
	height: 100%;

	.slider-container {
		overflow: hidden;
		height: 70vh;
		display: flex;
		justify-content: center;
		flex-direction: column;
		.slider-images {
			display: flex;
			flex-direction: row;
			height: 70%;
			.image-wrapper {
				height: 100%;
				min-width: 70vw;
				margin: 0 0 0 15vw;
				img {
					width: 100%;
					height: 100%;
					pointer-events: none;
					object-fit: cover;
					object-position: bottom;
				}
			}
		}
	}

	.family-item {
		min-width: 50vw;
		margin-left: 3.33333vw;

		&:first-of-type {
			margin-left: 0;
		}
	}

	.family-item-image {
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;

		&:before {
			content: "";
			display: block;
			width: 100%;
			padding-top: 150%;
			pointer-events: none;
		}
	}
	.project-title-container {
		position: absolute;
		left: 15vw;
		z-index: 5;
		bottom: -1.5vh;
		.project-title p {
			font-size: 4rem;
			font-weight: 400;
			color: #fff;
			font-family: "Gallient";
		}
	}
	.project-info {
		position: absolute;
		display: flex;
		flex-direction: column;
		justify-content: center;
		z-index: 5;
		left: 15vw;
		top: 6vh;

		.info li {
			font-size: 1.2rem;
			font-weight: 300;
			color: #fff;
		}
		.info p {
			color: #fff;
			display: none;
		}
	}

	@media only screen and (min-width: 1200px) {
		.slider-container {
			.slider-images {
				height: 75%;
				.image-wrapper {
					min-width: 40vw;
					margin: 0 0 0 30vw;
				}
			}
		}
		.project-title-container {
			left: 14vw;
			bottom: 12vh;

			.project-title p {
				font-size: 6rem;
			}
		}
		.project-info {
			right: 8vw;
			left: auto;
			top: 50%;
			bottom: 50%;
			transform: translate(0, -50%);
			.info li {
				display: list-item;
				padding-bottom: 0.5rem;
				font-size: 1.3rem;
			}
			.info p {
				display: block;
				padding-bottom: 0.5rem;
				font-size: 1.3rem;
			}
		}
	}

	@media only screen and (min-width: 1560px) {
		.slider-container {
			.slider-images {
				height: 85%;
				.image-wrapper {
					min-width: 42vw;
				}
			}
		}

		.project-title-container {
			bottom: 6vh;

			.project-title p {
				font-size: 9rem;
			}
		}

		.project-info {
			right: 11vw;
			.info li {
				font-size: 1.5rem;
			}
			.info p {
				font-size: 1.5rem;
			}
		}
	}
`;
