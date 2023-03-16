import styled from "styled-components";

export const StyledFooter = styled.div`
	position: fixed;
	width: 100%;
	z-index: 7;
	bottom: 0;
	display: flex;
	flex-direction: row;
	align-items: flex-start;
	justify-content: flex-end;
	height: 8.4vh;
	padding: 0 2rem;
	/* background-color: #1e1e1e; // FIXME: change color in project */
	/* background-color: #fff; // FIXME: change color in project */

	.footer-text-scrollDown {
		float: right;
		font-weight: 300;
		font-size: 0.9rem;
		color: #909090;
	}
	.footer-text-holdDrag {
		display: none;
		opacity: 0;
		float: right;
		font-weight: 300;
		font-size: 0.9rem;
		color: #909090;
	}

	@media only screen and (min-width: 600px) {
		padding: 0 4rem;
		height: 9vh;
	}

	/* Large devices (laptops/desktops, 950px and up) */
	@media only screen and (min-width: 950px) {
		padding: 0 6rem;
		height: 10vh;

		.footer-text-holdDrag,
		.footer-text-scrollDown {
			font-size: 1rem;
		}
	}

	/* Extra large devices (large laptops and desktops, 1200px and up) */
	@media only screen and (min-width: 1200px) {
		padding: 0 14rem;
	}

	/* Extra large devices (large laptops and desktops, 1500px and up) */

	@media only screen and (min-width: 1560px) {
	}
`;
