import styled from "styled-components";

//background images
import circleRight from "../../static/img/circle-right.svg";
import circleLeft from "../../static/img/circle-left.svg";
import line from "../../static/img/line.svg";

export const StyledHomeHero = styled.div`
	position: relative;
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	background: transparent;
	align-items: flex-start;
	padding: 15vh 0;

	.footer {
		height: 15vh;
		display: flex;
		justify-content: end;
		align-items: center;
		padding: 0 1.6rem;
		bottom: 0;
		position: absolute;
		&:hover .arrow-down.icon::before {
			top: 40px;
		}

		&:hover .arrow-down.icon {
			height: 52px;
		}
		.arrow-down.icon {
			color: #fff;
			position: absolute;
			margin-left: 10px;
			margin-top: 2px;
			width: 1px;
			height: 35px;
			background-color: currentColor;
			transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
		}

		.arrow-down.icon:before {
			content: "";
			position: absolute;
			left: -5px;
			top: 23px;
			width: 10px;
			height: 10px;
			border-top: solid 1px currentColor;
			border-right: solid 1px currentColor;
			-webkit-transform: rotate(135deg);
			transform: rotate(135deg);
			transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
		}
	}

	.hero-section {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		width: calc(100% - 3rem);
		margin: 0 auto;

		.top {
			display: flex;
			flex-direction: column;
			align-items: flex-start;
			p {
				font-size: 5rem;
				text-transform: uppercase;
				line-height: 100%;
				overflow: hidden;
				margin: 0.5rem 0;

				&:nth-child(2) span {
					-webkit-text-stroke-width: 1px;
					-webkit-text-stroke-color: #fff;
					color: transparent;
				}
				span {
					transform: translate(0, 0);
					display: inline-block;
				}
			}
		}
		.middle {
			margin: 0.5rem 0 0 0;
			display: flex;
			flex-direction: column;
			align-items: flex-start;

			p {
				font-size: 1.1rem;
				line-height: 100%;
				overflow: hidden;
				margin: 0.25rem 0;
				span {
					transform: translate(0, 0);
					display: inline-block;
				}
			}
		}
	}

	//resume-btn

	.resume-btn a {
		margin: 1.5rem 0 0 0;
		color: #fff;
		font-weight: 800;
		text-decoration: none;
		text-transform: uppercase;
		font-size: 18px;
		width: 18rem;
		height: 3rem;
		letter-spacing: 2px;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: transparent;
		position: relative;

		&:hover .border-hover1::before,
		&:hover .border-hover1::after,
		&:hover .border-hover2::before,
		&:hover .border-hover2::after {
			transform: scale(1);
		}

		&::before {
			content: "";
			position: absolute;
			top: 0;
			width: 100%;
			height: 1px;
			background-color: #fff;
			opacity: 0.2;
			transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
		}

		&::after {
			content: "";
			position: absolute;
			right: 0;
			width: 1px;
			height: 100%;
			background-color: #fff;
			opacity: 0.2;
			transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
		}

		.border-hover1 {
			position: absolute;
			width: 100%;
			height: 100%;

			&::before {
				content: "";
				position: absolute;
				bottom: 0;
				width: 100%;
				height: 1px;
				background-color: #fff;
				transform: scale(0);
				transform-origin: right;
				opacity: 1;
				transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
			}

			&::after {
				content: "";
				position: absolute;
				left: 0;
				width: 1px;
				height: 100%;
				transform-origin: right;
				background-color: #fff;
				transform: scale(0);
				transform-origin: bottom;
				opacity: 1;
				transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
			}
		}
		.border-hover2 {
			position: absolute;
			width: 100%;
			height: 100%;

			&::before {
				content: "";
				position: absolute;
				top: 0;
				width: 100%;
				height: 1px;
				background-color: #fff;
				transform: scale(0);
				transform-origin: left;
				opacity: 1;
				transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
			}

			&::after {
				content: "";
				position: absolute;
				right: 0;
				width: 1px;
				height: 100%;
				background-color: #fff;
				transform: scale(0);
				transform-origin: top;
				opacity: 1;
				transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
			}
		}
		.border {
			position: absolute;
			width: 100%;
			height: 100%;
			&::before {
				content: "";
				position: absolute;
				bottom: 0;
				width: 100%;
				height: 1px;
				background-color: #fff;
				opacity: 0.2;
				transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
			}

			&::after {
				content: "";
				position: absolute;
				left: 0;
				width: 1px;
				height: 100%;
				background-color: #fff;
				opacity: 0.2;
				transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
			}
		}
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		.hero-section {
			width: calc(100% - 30vw);
			.top {
				p {
					font-size: 7rem;
				}
			}
			.middle {
				margin: 0.5rem 0;
				p {
					font-size: 1.3rem;
				}
			}
		}

		.footer {
			padding: 0 2.6rem;
		}

		.back-circle-1 {
			left: -30px;
		}
		.back-circle-2 {
			width: 16rem;
			height: 33rem;
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		.hero-section {
			width: calc(100% - 50vw);
			.top {
				p {
					font-size: 9rem;
				}
			}
		}

		.resume-btn a {
			margin: 2rem 0 0 0;
			font-size: 22px;
			width: 20rem;
			height: 4rem;
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
