import styled from "styled-components";

export const StyledNavBar = styled.div`
	height: 15vh;
	width: 100%;
	display: flex;
	align-items: center;
	position: absolute;
	.logo-container {
		position: fixed;
		left: 1.5rem;
		background-color: transparent;
		z-index: 999;
		font-size: 2rem;
		mix-blend-mode: difference;
	}

	@media only screen and (min-width: 600px) {
		.logo-container {
			left: 2.5rem;
		}
	}
`;
