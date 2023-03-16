import styled from "styled-components";

export const StyledHome = styled.div`
	margin: 0 2rem;
	height: 90vh;
	position: relative;

	//scroll-down

	.hero-footer {
		position: absolute;
		bottom: 0;
		height: 25vh;
		width: 100%;
	}

	.hero-footer .scroll-down {
		position: absolute;
		bottom: 2rem;

		margin-bottom: -5px;
		right: 0;
		font-weight: 600;
		color: #323232;
	}

	//resume-btn

	.hero-footer .resume-btn {
		color: #fff;
		font-weight: 800;
		text-decoration: none;
		text-transform: uppercase;
		font-size: 25px;
		width: 13rem;
		height: 4rem;
		letter-spacing: 2px;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #323232;
		cursor: pointer;
		background-color: #323232;
	}

	.resume-btn:hover {
		color: #fff;
		background-color: #774dee;
		transition: 0.4s ease;
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
		margin: 0 4rem;
		height: 85vh;

		.hero-footer {
			height: 20vh;
		}
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		margin: 0 6rem;
		height: 75vh;
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		margin: 0 14rem;
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1400px) {
		margin: 0 14rem;
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
