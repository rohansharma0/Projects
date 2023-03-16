import styled from "styled-components";

export const StyledHeader = styled.div`
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: flex-end;
	height: 8.4vh;
	padding: 0 2rem;
	width: 100%;
	z-index: 8;
	top: 0;
	position: fixed;
	background-color: #fff; // FIXME: change color in project
	/* background-color: #1e1e1e; // FIXME: change color in project */

	.nav {
		display: flex;
		align-items: flex-end;

		.work-nav {
			display: none;
			opacity: 0;
			position: absolute;
			p {
				color: #774dee;
				font-size: 1rem;
				font-weight: 300;
				display: flex;
				align-items: center;
				.tag {
					display: block;
					width: 16px;
					height: 1px;
					background-color: #774dee;
					margin-right: 0.5rem;
				}
				span {
					display: inline-block;
				}
			}
		}
		.project-nav {
			display: none;
			opacity: 0;
			position: absolute;
			p {
				color: #fff;
				font-size: 1rem;
				font-weight: 300;
				display: flex;
				align-items: center;
				.tag {
					display: block;
					width: 16px;
					height: 1px;
					background-color: #fff;
					margin-right: 0.5rem;
				}
				span {
					display: inline-block;
				}
			}
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		padding: 0 4rem;
		height: 9vh;
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		padding: 0 6rem;
		height: 10vh;
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		padding: 0 14rem;
		height: 15vh;

		.nav {
			.work-nav {
				p {
					font-size: 1.2rem;
					font-weight: 600;
					.tag {
						width: 20px;
						height: 2px;
					}
				}
			}
			.project-nav {
				p {
					font-size: 1.2rem;
					font-weight: 600;
					.tag {
						width: 20px;
						height: 2px;
					}
				}
			}
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
