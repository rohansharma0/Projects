import styled from "styled-components";

export const TextStyled = styled.div`
	height: 100vh;
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;

	.top,
	.bottom {
		height: 15vh;
	}

	.slider-container {
		overflow: hidden;
		height: 70vh;
		display: flex;
		justify-content: center;
		flex-direction: column;
		.slider-images {
			display: flex;
			flex-direction: row;
			height: 70%;
			.image-wrapper {
				height: 100%;
				min-width: 70vw;
				margin: 0 0 0 15vw;
				img {
					width: 100%;
					height: 100%;
					pointer-events: none;
					object-fit: cover;
				}
			}
		}
	}
`;
