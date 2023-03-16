import styled from "styled-components";

export const StyledHero = styled.div`
    display: flex;
    flex-direction: column;
    flex-grow: 1;

    .left-section {
        display: flex;
        flex-direction: column;
        flex: 1;
        justify-content: space-between;
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
        padding: 1rem;
    }
    .hero-btn {
        width: 8rem;
        height: 3rem;
        background-color: #00715d;
        color: #f9f4e8;
        font-size: 1.2rem;
        text-transform: uppercase;
        font-weight: 600;
        display: flex;
        justify-content: center;
        align-items: center;
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
        .left-section {
            margin: 0 3rem;
        }
        .hero-headline p {
            font-size: 4.5rem;
            width: 80%;
        }
        .hero-text {
            width: 80%;
        }

        .hero-btn {
            width: 10rem;
            height: 4rem;
            font-size: 1.4rem;
        }
        .fund-info-container {
            padding: 0.7rem 1.7rem;
        }
        .right-section {
            margin: 0 3rem;
            margin-top: 2rem;
        }
    }

    /* Large devices (laptops/desktops, 992px and up) */
    @media only screen and (min-width: 850px) {
        margin: 0 5rem;

        .left-section {
            flex: 4;
            padding-bottom: 7rem;
            margin: 0;
        }

        .hero-headline p {
            font-size: 5rem;
            font-weight: 600;
            color: #213330;
            width: 70%;
        }

        .hero-text p {
            font-size: 1.2rem;
            width: 70%;
            margin: 1rem 0;
        }
        .hero-btn {
            width: 12rem;
            height: 4rem;
            font-size: 1.8rem;
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

        .hero-text p {
            width: 80%;
            margin: 0;
        }
    }

    /* Extra large devices (large laptops and desktops, 1200px and up) */

    @media only screen and (min-width: 1560px) {
        .left-section {
            padding-bottom: 2rem;
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
        }
    }
`;
