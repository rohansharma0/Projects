import styled from "styled-components";
import circle from "../../static/img/circle-3.svg";

export const StyledHomeWork = styled.div`
	position: relative;
	display: flex;
	flex-direction: column;
	background: transparent;

	.marquee-text {
		color: #fff;
		font-size: 5rem;
		text-transform: uppercase;
		margin: 2rem 0 0 0;

		/* font-size: 8rem;
		margin: 4rem 0 0 0; */
	}

	.marquee-wrapper {
		padding: 7rem 0 0 0;

		.marquee-text-small {
			color: #fff;
			font-size: 1.5rem;
			text-transform: uppercase;
			margin: 1rem 0;
		}
	}

	.about-btn a {
		margin: 1.5rem 0;
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
	.title-container {
		.title {
			position: absolute;
			right: -20rem;
			top: 6rem;
			display: flex;
			align-items: center;

			p {
				font-size: 9rem;
				text-transform: uppercase;
				-webkit-text-stroke-width: 1px;
				-webkit-text-stroke-color: #818181;
				color: transparent;
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

	.work-section {
		display: flex;
		flex-direction: column;
		margin: 0 1.5rem;
		padding: 10rem 0;
		.top {
			align-items: flex-start;
			display: flex;
			flex-direction: column;
			flex-wrap: wrap;
			margin: 1rem 0;
			p {
				font-size: 1.2rem;
				overflow: hidden;
				margin: 0.25rem 0;

				span {
					transform: translate(0, 0);
					display: inline-block;
				}
			}
		}
		.middle {
			align-items: flex-start;
			display: flex;
			flex-direction: column;
			flex-wrap: wrap;
			margin: 1rem 0;
			p {
				font-size: 4rem;
				overflow: hidden;
				margin: 0.25rem 0;
				line-height: 100%;

				&:nth-child(2) {
					-webkit-text-stroke-color: #fff;
					-webkit-text-stroke-width: 1px;
					color: transparent;
				}

				span {
					transform: translate(0, 0);
					display: inline-block;
				}
			}
		}
	}
	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		.work-section {
			margin: 0 5rem;
			.top {
				p {
					font-size: 1.5rem;
				}
			}
			.middle {
				display: flex;
				flex-direction: column;
				flex-wrap: wrap;
				p {
					font-size: 6rem;
				}
			}
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		.work-section {
			margin: 0 10rem;
		}
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

		.back-circle-3 {
			top: 45rem;
			width: 29rem;
			height: 30rem;
		}

		.work-section {
			margin: 0 10vw;
			.top {
				align-items: flex-start;
				margin: 1.5rem 0;
				p {
					font-size: 2rem;
				}
			}
			.middle {
				align-items: flex-start;
				display: flex;
				flex-direction: column;
				flex-wrap: wrap;
				margin: 1.5rem 0;
				p {
					font-size: 6rem;
				}
			}
		}
		.about-btn a {
			font-size: 22px;
			width: 20rem;
			height: 4rem;
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
		.title-container {
			.title {
				right: 5rem;
				top: 6rem;

				p {
					font-size: 9rem;
				}
			}
		}
		.work-section {
			margin: 0 16vw;
			.top {
				p {
					font-size: 2rem;
				}
			}
			.middle {
				display: flex;
				flex-direction: column;
				flex-wrap: wrap;
				p {
					font-size: 7rem;
				}
			}
		}
	}
`;
