import styled from "styled-components";

export const StyledDonation = styled.div`
	width: 100%;
	height: 100vh;
	display: flex;
	flex-direction: column;

	.container {
		display: flex;
		flex-direction: row;
		height: 100%;
	}

	.side-image {
		flex: 1;
		display: none;
	}
	.donation-wrapper {
		flex: 1;
		background-color: burlywood;
	}

	/* Small devices (portrait tablets and large phones, 600px and up) */
	@media only screen and (min-width: 600px) {
	}

	/* Large devices (laptops/desktops, 992px and up) */
	@media only screen and (min-width: 850px) {
		.side-image {
			display: block;
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
