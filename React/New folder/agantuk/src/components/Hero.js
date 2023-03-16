import React, { useEffect } from "react";
import { StyledHero } from "./styles/Hero.styled";

import hoverEffect from "hover-effect";
import image01 from "./img/img_one.jpg";
import image02 from "./img/img_one.jpg";
import displacementImage from "../img/dist/14.jpg";

export default function Hero() {
    useEffect(() => {
        var myAnimation = new hoverEffect({
            parent: document.querySelector(".right-section"),
            intensity: 0.3,
            image1: image01,
            image2: image02,
            displacementImage: displacementImage,
        });
    });

    return (
        <StyledHero>
            <div class="left-section">
                <div class="hero-headline">
                    <p>Let's Help Those Who Are More In Need.</p>
                </div>
                <div class="hero-text">
                    <p>
                        We are committed to continue to develop and voice our
                        program to help those in need by raising funds from
                        donors and our partners nors and our partners
                    </p>
                </div>
                <div class="hero-btn">Donate</div>
                <div class="hero-social-links">
                    <a href="">Youtube</a>
                    <a href="">Instagram</a>
                    <a href="">Facebook</a>
                </div>
                <div class="fund-info-container">
                    <p class="fund-info-text">Total Funds Dotated</p>
                    <p class="fund-info-amount-text">89,821</p>
                </div>
            </div>
            <div class="right-section"></div>
        </StyledHero>
    );
}
