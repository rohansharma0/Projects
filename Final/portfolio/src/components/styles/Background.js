import styled from "styled-components";
import noiseImg from "../../static/img/noise.png";
export const StyledBackground = styled.div`
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #080808;
	z-index: -2;

	.noise {
		position: fixed;
		z-index: 9999;
		top: -300%;
		left: -150%;
		height: 600%;
		opacity: 0.12;
		width: 600%;
		background-image: url(${noiseImg});
		background-size: 200px;
		background-repeat: repeat;
		pointer-events: none;
		animation: grain 7s steps(10) infinite;

		@-webkit-keyframes grain {
			0%,
			to {
				transform: translate(0);
			}
			10% {
				transform: translate(-5%, -10%);
			}
			20% {
				transform: translate(-15%, 5%);
			}
			30% {
				transform: translate(7%, -25%);
			}
			40% {
				transform: translate(-5%, 25%);
			}
			50% {
				transform: translate(-15%, 10%);
			}
			60% {
				transform: translate(15%);
			}
			70% {
				transform: translateY(15%);
			}
			80% {
				transform: translate(3%, 35%);
			}
			90% {
				transform: translate(-10%, 10%);
			}
		}
		@keyframes grain {
			0%,
			to {
				transform: translate(0);
			}
			10% {
				transform: translate(-5%, -10%);
			}
			20% {
				transform: translate(-15%, 5%);
			}
			30% {
				transform: translate(7%, -25%);
			}
			40% {
				transform: translate(-5%, 25%);
			}
			50% {
				transform: translate(-15%, 10%);
			}
			60% {
				transform: translate(15%);
			}
			70% {
				transform: translateY(15%);
			}
			80% {
				transform: translate(3%, 35%);
			}
			90% {
				transform: translate(-10%, 10%);
			}
		}
	}
`;

/* .back-circle-1 {
		position: absolute;
		background-image: url(${circleLeft});
		background-size: cover;
		top: -45px;
		z-index: -1;
		opacity: 0.5;
		width: 19rem;
		height: 23rem;
		left: -70px;
	}

	.back-circle-2 {
		background-image: url(${circleRight});
		position: absolute;
		background-size: cover;
		width: 10rem;
		height: 25rem;
		z-index: -1;
		opacity: 0.5;
		right: 0;
		bottom: -10rem;
	}

	.back-line {
		background-image: url(${line});
		position: absolute;
		background-size: cover;
		position: absolute;
		background-size: contain;
		width: 100%;
		height: 100vh;
		opacity: 0.5;
		background-repeat: no-repeat;
		background-position: center;
		transform: rotateZ(320deg);
		z-index: -1;
	} */

// .back-circle-3 {
// 	position: absolute;
// 	background-image: url(${circle});
// 	background-size: cover;
// 	top: 47rem;
// 	z-index: -1;
// 	opacity: 0.5;
// 	width: 21rem;
// 	height: 22rem;
// 	left: -13rem;
// }
