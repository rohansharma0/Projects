import { createGlobalStyle } from "styled-components";

const GlobalStyles = createGlobalStyle`
    @import url("https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,600;0,700;1,400&family=Roboto:wght@300;400;500;700&display=swap");

    /* Scroll Bar */

    body::-webkit-scrollbar {
        width: 0.5em;
        background: #213330;
    }

    body::-webkit-scrollbar-track {
        box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    }

    body::-webkit-scrollbar-thumb {
        background-color: #fbd561;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        text-decoration: none;
    }

    body {
        background-color: #f9f4e8;
        font-family: "Cormorant Garamond", serif;
    }

`;

export default GlobalStyles;
