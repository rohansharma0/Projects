import styled from "styled-components";
export const StyledCursor = styled.div`
	.app-cursor {
		display: block;
		opacity: 0;
		z-index: 10000;
		border-radius: 50%;
		width: 2rem;
		height: 2rem;
		background-color: #fff;
		pointer-events: none;
		overflow: hidden;
		transform: translate3d(0, 0, 0);
		position: fixed;
		transition: opacity 0.3s ease-in-out;
		transition: transform 0.2s cubic-bezier(0.76, 0, 0.24, 1);
		mix-blend-mode: difference;
	}

	.clickableLink-grow {
		transform: scale(2) !important;
	}

	.clickableLink-shrink {
		transform: scale(0.6);
	}
`;
