import styled from "styled-components";

export const Nav = styled.div`
    display: flex;
    flex-direction: row;
    padding: 1rem;
    justify-content: space-between;
    align-items: center;

    .nav-logo p {
        color: #213330;
        font-weight: 600;
        font-size: 2rem;
        display: flex;
        align-items: center;
    }
    .nav-logo p span {
        font-size: 3rem;
    }

    .nav-links {
        display: none;
        position: fixed;
        top: 0;
        right: 0;
        background-color: #213330;
        height: 100vh;
        flex-direction: column;
        width: 100%;
        z-index: 999;

        align-items: center;
        padding: 2rem 0;
    }

    .links {
        display: flex;
        flex-direction: column;
        margin: 2rem 0;
        align-items: center;
    }

    .links .active {
        font-weight: 700;
    }

    .close.icon {
        color: #f9f4e8;
        position: absolute;
        right: 2rem;
        width: 25px;
        height: 25px;
        cursor: pointer;
    }

    .close.icon:before {
        content: "";
        position: absolute;
        top: 10px;
        width: 25px;
        height: 2px;
        background-color: currentColor;
        -webkit-transform: rotate(-45deg);
        transform: rotate(-45deg);
    }

    .close.icon:after {
        content: "";
        position: absolute;
        top: 10px;
        width: 25px;
        height: 2px;
        background-color: currentColor;
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    .menu.icon {
        color: #213330;
        position: relative;
        width: 1.2rem;
        height: 2px;
        background-color: currentColor;
        cursor: pointer;
    }

    .menu.icon:before {
        content: "";
        position: absolute;
        top: -5px;
        left: 0;
        width: 1.2rem;
        height: 2px;
        background-color: currentColor;
    }

    .menu.icon:after {
        content: "";
        position: absolute;
        top: 5px;
        left: 0;
        width: 1.2rem;
        height: 2px;
        background-color: currentColor;
    }

    .links a {
        font-weight: 400;
        color: #f9f4e8;
        font-size: 2rem;
        margin: 1rem 0;
        text-transform: uppercase;
        transition: 0.3s ease-in-out;

        &:hover {
            color: #fbd561;
        }
    }

    /* Small devices (portrait tablets and large phones, 600px and up) */
    @media only screen and (min-width: 600px) {
        padding: 1rem 3rem;
        .menu.icon {
            width: 1.5rem;
            height: 3px;
        }

        .menu.icon:before {
            top: -6px;
            width: 1.5rem;
            height: 3px;
        }

        .menu.icon:after {
            top: 6px;
            width: 1.5rem;
            height: 3px;
        }

        .close.icon {
            width: 1.5rem;
            height: 1.5rem;
        }

        .close.icon:before {
            width: 1.5rem;
            height: 3px;
        }

        .close.icon:after {
            width: 1.5rem;
            height: 3px;
        }
    }

    /* Large devices (laptops/desktops, 992px and up) */
    @media only screen and (min-width: 850px) {
        padding: 2rem 5rem;

        .nav-logo p {
            font-size: 3rem;
        }
        .nav-logo p span {
            font-size: 4rem;
        }
        .menu {
            display: none;
        }
        .nav-links {
            display: block;
            padding: 0;
            position: initial;
            height: auto;
            background-color: initial;
            width: auto;
        }

        .links {
            display: block;
            margin: 0;
        }

        .links a {
            font-size: 1.2rem;
            color: #213330;
            margin-left: 3rem;

            &:hover {
                color: #213330;
            }
        }

        .nav-links .close {
            display: none;
        }
    }

    /* Extra large devices (large laptops and desktops, 1200px and up) */
    @media only screen and (min-width: 1200px) {
    }

    /* Extra large devices (large laptops and desktops, 1200px and up) */

    @media only screen and (min-width: 1560px) {
    }
`;
