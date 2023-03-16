import styled from "styled-components";

export const StyledHomeFooter = styled.div`
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	background-color: #000;

	.hero-section {
		display: flex;
		flex-direction: column;
		justify-content: center;
		flex-grow: 1;
		padding-top: 15vh;
		.top {
			margin: 0 1.5rem;
			p {
				font-size: 1.5rem;
			}
			h3 {
				font-size: 3rem;
				margin: 1.5rem 0;
			}
		}

		.bottom {
			margin: 0 1.5rem;
			display: flex;
			flex-wrap: wrap;

			.bottom-container {
				width: 50%;
				padding: 1.5rem 0;
				h4 {
					font-size: 1.2rem;
					margin: 0.5rem 0;
					letter-spacing: 0.5px;
				}
				p {
					font-size: 0.8rem;
					margin: 0.25rem 0;
					letter-spacing: 0.5px;
					color: #fff;
				}
			}
		}
	}

	.footer {
		height: 15vh;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: flex-start;
		padding: 0 1.5rem;
		position: relative;

		.footer-arrow {
			position: absolute;
			right: 0;
			height: 15vh;
			display: flex;
			justify-content: center;
			align-items: center;
			padding: 0 1.85rem;
			&:hover .arrow-down.icon::before {
				top: 1px;
			}

			&:hover .arrow-down.icon {
				height: 53px;
			}

			.arrow-down.icon {
				color: #fff;
				position: absolute;
				margin-top: 2px;
				width: 1px;
				height: 35px;
				transition: 0.5s cubic-bezier(0.17, 0.85, 0.438, 0.99);
				background-color: currentColor;
			}

			.arrow-down.icon:before {
				content: "";
				position: absolute;
				left: -5px;
				top: 1px;
				width: 10px;
				height: 10px;
				border-top: solid 1px currentColor;
				border-right: solid 1px currentColor;
				-webkit-transform: rotate(135deg);
				transform: rotate(-45deg);
			}
		}

		.left {
			display: flex;
			flex-direction: row;
			align-items: center;
			justify-content: flex-start;

			.left-text {
				display: flex;
				flex-direction: row;

				.heart.icon {
					color: #000;
					position: absolute;
					margin-top: 6px;
					margin-left: 5px;
					width: 9px;
					height: 9px;
					border-left: solid 1px currentColor;
					border-bottom: solid 1px currentColor;
					-webkit-transform: rotate(-45deg);
					transform: rotate(-45deg);
				}

				.heart.icon:before {
					content: "";
					position: absolute;
					top: -5px;
					left: -1px;
					width: 8px;
					height: 5px;
					border-radius: 5px 5px 0 0;
					border-top: solid 1px currentColor;
					border-left: solid 1px currentColor;
					border-right: solid 1px currentColor;
				}

				.heart.icon:after {
					content: "";
					position: absolute;
					top: 0px;
					left: 8px;
					width: 5px;
					height: 8px;
					border-radius: 0 5px 5px 0;
					border-top: solid 1px currentColor;
					border-right: solid 1px currentColor;
					border-bottom: solid 1px currentColor;
				}

				p {
					margin-left: 0;
				}
			}
		}
		.right {
			display: flex;
			flex-direction: row;
			align-items: center;
			justify-content: flex-end;
		}

		p {
			font-size: 10px;
			letter-spacing: 0.5px;
			color: #78809e;
			margin-left: 1rem;
		}

		.footer-rolling-text {
			font-size: 10px;
			letter-spacing: 0.5px;
			color: #78809e;
			margin: 0.25rem 0;
			margin-right: 1rem;
			overflow: hidden;
			height: 12px;
			letter-spacing: 0.5px;
			span {
				font-size: 100%;
			}
		}

		.footer-rolling-text:hover .letter,
		.footer-rolling-text.play .letter {
			transform: translateY(-100%);
		}

		.footer-rolling-text .block:last-child {
			color: #fff;
		}

		.footer-rolling-text .letter {
			display: inline-block;
			transition: transform 0.6s cubic-bezier(0.76, 0, 0.24, 1);
		}

		.letter:nth-child(1) {
			transition-delay: 0s;
		}

		.letter:nth-child(2) {
			transition-delay: 0.015s;
		}

		.letter:nth-child(3) {
			transition-delay: 0.03s;
		}

		.letter:nth-child(4) {
			transition-delay: 0.045s;
		}

		.letter:nth-child(5) {
			transition-delay: 0.06s;
		}

		.letter:nth-child(6) {
			transition-delay: 0.075s;
		}

		.letter:nth-child(7) {
			transition-delay: 0.09s;
		}

		.letter:nth-child(8) {
			transition-delay: 0.105s;
		}

		.letter:nth-child(9) {
			transition-delay: 0.12s;
		}
	}
	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		.hero-section {
			.top {
				margin: 0 5rem;
				p {
					font-size: 1.7rem;
				}
				h3 {
					font-size: 3.2rem;
				}
			}

			.bottom {
				margin: 0 5rem;
				.bottom-container {
					h4 {
						font-size: 1.4rem;
					}
					p {
						font-size: 1rem;
					}
				}
			}
		}

		.footer {
			padding: 0 5rem;
			.footer-arrow {
				position: absolute;
				padding: 0 2.85rem;
			}
			p {
				font-size: 0.8rem;
			}

			.footer-rolling-text {
				font-size: 0.8rem;
				height: 1rem;
			}
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		.hero-section {
			.top {
				margin: 0 10rem;
			}

			.bottom {
				margin: 0 10rem;
			}
		}

		.footer {
			padding: 0 10rem;
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		.hero-section {
			.top {
				margin: 0 10vw;
				p {
					font-size: 2rem;
				}
				h3 {
					font-size: 5rem;
				}
			}

			.bottom {
				margin: 0 10vw;
				.bottom-container {
					width: 25%;
					h4 {
						font-size: 1.7rem;
						margin: 1rem 0;
					}
					p {
						font-size: 1.2rem;
						margin: 0.5rem 0;
					}
				}
			}
		}

		.footer {
			padding: 0 10vw;
			flex-direction: row;
			justify-content: space-between;
			align-items: center;
		}
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
		.hero-section {
			.top {
				margin: 0 16vw;
				p {
					font-size: 2.2rem;
				}
				h3 {
					font-size: 5.5rem;
				}
			}

			.bottom {
				margin: 0 16vw;
				.bottom-container {
					h4 {
						font-size: 1.9rem;
						margin: 1.5rem 0;
					}
					p {
						font-size: 1.4rem;
						margin: 1rem 0;
					}
				}
			}
		}

		.footer {
			padding: 0 16vw;

			p {
				font-size: 1rem;
			}
			.footer-rolling-text {
				font-size: 1rem;
				height: 1.2rem;
			}
		}
	}
`;
