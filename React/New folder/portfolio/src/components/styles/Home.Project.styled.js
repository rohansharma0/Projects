import styled from "styled-components";

export const StyledHomeProject = styled.div`
	height: 100vh;
	width: 100%;
	background-color: #1e1e1e;

	.top {
		display: flex;
		align-items: center;
		height: 15vh;
		margin: 0 2rem;
		p {
			color: #fff;
			font-size: 1rem;
			font-weight: 600;
			display: flex;
			align-items: center;
			.tag {
				display: block;
				width: 16px;
				height: 2px;
				background-color: #fff;
				margin-right: 0.5rem;
			}
		}
	}

	.project-footer {
		height: 15vh;
		display: flex;
		flex-direction: row;
		justify-content: end;
		margin: 0 2rem;
		align-items: center;
		color: #7c7c7c;
		font-size: 14px;
	}
`;
