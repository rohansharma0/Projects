import styled from "styled-components";

export const StyledHero = styled.div`
    display: flex;
    flex-direction: column;
    flex-grow: 1;

    .left-section {
        display: flex;
        flex-direction: column;
        flex: 1;
        align-items: flex-start;
        position: relative;
    }

    .hero-headline p {
        font-size: 3rem;
        font-weight: 600;
        color: #213330;
        width: 100%;
        padding: 1rem;
    }

    .hero-text p {
        font-size: 1.2rem;
        color: #213330;
        width: 100%;
        padding: 2rem 1rem;
    }
    .hero-btn {
        width: 10rem;
        height: 3rem;
        background-color: #00715d;
        color: #f9f4e8;
        font-size: 1.2rem;
        text-transform: uppercase;
        font-weight: 600;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 1rem;
        transition: 0.3s ease-in-out;

        &:hover {
            background-color: #fbd561;
            color: #213330;
        }
    }
    .hero-social-links {
        display: none;
    }
    .hero-social-links a {
        font-size: 1.2rem;
        font-weight: 600;
        margin-right: 3rem;
        color: #213330;
    }

    .right-section {
        flex: 1;
        background-color: #d1d1d1;
        display: flex;
    }

    .fund-info-container {
        position: absolute;
        bottom: 0;
        right: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        border-radius: 1rem 0 0 0;
        background-color: #fbd561;
        padding: 0.5rem 1.5rem;
    }
    .fund-info-text {
        font-size: 1rem;
        font-weight: 600;
    }
    .fund-info-amount-text {
        font-size: 2.5rem;
    }

    /* Small devices (portrait tablets and large phones, 600px and up) */
    @media only screen and (min-width: 600px) {
        .hero-headline p {
            font-size: 4.5rem;
            padding: 1rem 3rem;
        }
        .hero-text p {
            width: 80%;
            padding: 2rem 3rem;
        }

        .hero-btn {
            width: 10rem;
            height: 4rem;
            font-size: 1.4rem;
            margin: 1rem 3rem 3rem 3rem;
        }
        .fund-info-container {
            padding: 0.7rem 1.7rem;
            right: 3rem;
        }
        .right-section {
            margin: 0 3rem;
        }
    }

    /* Large devices (laptops/desktops, 992px and up) */
    @media only screen and (min-width: 850px) {
        .left-section {
            flex: 4;
            margin: 0;
        }

        .hero-headline p {
            font-size: 5rem;
            font-weight: 600;
            color: #213330;
            width: 90%;
            padding: 2rem 5rem;
        }

        .hero-text p {
            font-size: 1.2rem;
            padding: 2rem 5rem;
        }
        .hero-btn {
            width: 12rem;
            height: 4rem;
            font-size: 1.8rem;
            margin: 1rem 5rem 5rem 5rem;
        }
        .hero-social-links {
            display: none;
        }

        .right-section {
            flex: 5;
            background-color: #d1d1d1;
            margin: 0;
        }

        .fund-info-container {
            padding: 1rem 2rem;
            right: 0;
        }
        .fund-info-text {
            font-size: 1.1rem;
        }
        .fund-info-amount-text {
            font-size: 3rem;
        }
    }

    /* Extra large devices (large laptops and desktops, 1200px and up) */
    @media only screen and (min-width: 1200px) {
        flex-direction: row;

        .hero-headline p {
            width: 95%;
        }
        .left-section {
            justify-content: space-around;
        }

        .hero-headline p {
            width: 100%;
            padding: 0 2rem 0 5rem;
        }

        .hero-text p {
            width: 80%;
            margin: 0;
            padding: 0 2rem 0 5rem;
        }
        .hero-btn {
            margin: 0 0 0 5rem;
        }
        .right-section {
            margin-right: 5rem;
        }
    }

    /* Extra large devices (large laptops and desktops, 1200px and up) */

    @media only screen and (min-width: 1560px) {
        .left-section {
            padding-bottom: 1rem;
        }

        .hero-headline p {
            font-size: 6rem;
            width: 95%;
        }

        .hero-text p {
            width: 90%;
        }

        .hero-social-links {
            display: block;
            margin: 0 0 0 5rem;
        }
    }
`;
