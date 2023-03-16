import styled from "styled-components";
export const StyledProject = styled.div`
	@font-face {
		font-family: "Gallient";
		src: url("./fonts/GallientRegular.ttf") format("truetype");
		font-weight: 400;
	}

	height: 100%;
	position: relative;
	padding: 5vh 0;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;

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

	.container {
		position: absolute;
		height: 55vh;
		display: flex;
		flex-direction: row;
		z-index: 4;
		padding: 3vh 0;

		.block {
			height: 100%;
			width: 70vw;
			margin: 0px 0 0 15vw;
			overflow: hidden;
			position: relative;
			/* will-change: transform;
	clip-path: inset(100% 0% 0% 0%);
	transition: clip-path 1s cubic-bezier(0.77, 0, 0.175, 1); */
			transform: scale(1);
			transition: transform 0.75s cubic-bezier(0.77, 0, 0.175, 1);
		}
		.block:hover {
			transform: scale(1.1);
		}
		.block img {
			position: absolute;
			height: 100%;
			width: 100%;
			object-fit: cover;
			object-position: bottom;
			will-change: transform;
			/* transform: scale(1.1);
	transition: transform 2s cubic-bezier(0.77, 0, 0.175, 1); */
		}

		.sepia {
			filter: grayscale(100%) sepia(5%) brightness(95%);
		}

		.masked {
			clip-path: circle(25% at 50% 50%);
		}
	}

	.project-title-container {
		position: absolute;
		left: 15vw;
		z-index: 5;
		bottom: 4vh;
		.title p {
			font-size: 4rem;
			font-weight: 400;
			color: #fff;
			font-family: "Gallient";
		}
	}

	@media only screen and (min-width: 1200px) {
		.container {
			height: 65vh;
		}
		.project-title-container {
			left: 12vw;
			bottom: 12vh;

			.title p {
				font-size: 6rem;
			}
		}
		.project-info {
			.info li {
				font-size: 1.5rem;
			}
		}
	}

	@media only screen and (min-width: 1200px) {
		.container {
			.block {
				height: 100%;
				width: 46vw;
				margin: 0px 0 0 25vw;
			}
		}

		.project-title-container {
			left: 14vw;

			.title p {
				font-size: 9rem;
			}
		}

		.project-info {
			right: 11vw;
			left: auto;
			top: auto;

			.info li {
				display: list-item;
				padding-bottom: 0.5rem;
				font-size: 1.5rem;
			}
			.info p {
				display: block;
				padding-bottom: 0.5rem;
				font-size: 1.5rem;
			}
		}
	}
`;
