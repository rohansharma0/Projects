import styled from "styled-components";

export const StyledMain = styled.main`
    display: flex;
    flex-direction: column;
    height: 100vh;
    position: relative;

    .sidebg {
        display: none;
        width: 50%;
        height: 100%;
        position: absolute;
        right: 0;
        background-color: #fbd561;
        z-index: -1;
    }

    /* Small devices (portrait tablets and large phones, 600px and up) */
    @media only screen and (min-width: 600px) {
        height: 130vh;
    }

    /* Large devices (laptops/desktops, 992px and up) */
    @media only screen and (min-width: 850px) {
        height: 170vh;
    }

    /* Extra large devices (large laptops and desktops, 1200px and up) */
    @media only screen and (min-width: 1200px) {
        height: 100vh;

        .sidebg {
            display: block;
        }
    }

    /* Extra large devices (large laptops and desktops, 1200px and up) */

    @media only screen and (min-width: 1560px) {
    }
`;
