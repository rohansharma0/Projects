import React from "react";

import Header from "./Header";
import Hero from "./Hero";
import { StyledMain } from "./styles/Main.styled";

function Main() {
    return (
        <StyledMain>
            <span class="sidebg"></span>
            <Header />
            <Hero />
        </StyledMain>
    );
}

export default Main;
