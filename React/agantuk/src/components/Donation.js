import React, { useEffect } from "react";
import hoverEffect from "hover-effect";
import image01 from "../img/img_one.jpg";
import image02 from "../img/img_two.jpg";
import displacementImage from "../img/dist/14.jpg";

import Header from "./Header";
import { StyledDonation } from "./styles/Donation.styled";

function Donation() {
    useEffect(() => {
        var myAnimation = new hoverEffect({
            parent: document.querySelector(".side-image"),
            intensity: 0.3,
            image1: image01,
            image2: image02,
            displacementImage: displacementImage,
        });
    });

    return (
        <StyledDonation>
            <Header />
            <div class="container">
                <div class="side-image"></div>
                <div class="donation-wrapper">
                    <p>Donation</p>
                </div>
            </div>
        </StyledDonation>
    );
}

export default Donation;
