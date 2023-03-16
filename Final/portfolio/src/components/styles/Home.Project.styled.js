import styled from "styled-components";

export const StyledHomeProject = styled.div`
	/* position: relative; */
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	background: #fff;

	.marquee-text {
		color: #000;
		font-size: 5rem;
		text-transform: uppercase;
		margin: 2rem 0 0 0;

		/* font-size: 8rem;
		margin: 4rem 0 0 0; */
	}

	.marquee-wrapper {
		padding: 7rem 0 0 0;

		.marquee-text-small {
			color: #000;
			font-size: 1.5rem;
			text-transform: uppercase;
			margin: 1rem 0;
		}
	}

	.title-container {
		.title {
			position: absolute;
			right: -19rem;
			top: 6rem;

			display: flex;
			align-items: center;

			p {
				font-size: 9rem;
				text-transform: uppercase;
				-webkit-text-stroke-width: 1px;
				-webkit-text-stroke-color: #575757;
				color: transparent;
				letter-spacing: 5px;
			}
		}
	}
	.footer {
		height: 15vh;
		display: flex;
		justify-content: end;
		align-items: center;
		margin: 0 6vw;

		p {
			font-size: 14px;
			letter-spacing: 0.5px;
			color: #78809e;
		}
	}
	.project-wrapper {
		height: 70vh;
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		.marquee-text {
			font-size: 8rem;
			margin: 4rem 0 0 0;
		}
		.title-container {
			.title {
				right: 3rem;
				top: 3rem;

				p {
					font-size: 7rem;
				}
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
		.title-container {
			.title {
				right: 5rem;
				top: 3rem;

				p {
					font-size: 15rem;
				}
			}
		}
	}
`;
