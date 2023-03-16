import styled from "styled-components";
export const StyledCursor = styled.div`
	.app-cursor {
		z-index: 1000;
		border-radius: 50%;
		width: 1rem;
		height: 1rem;
		border: 1px solid #fff;
		pointer-events: none;
		overflow: hidden;
		transform: translate3d(0, 0, 0);
		position: fixed;
	}
`;
