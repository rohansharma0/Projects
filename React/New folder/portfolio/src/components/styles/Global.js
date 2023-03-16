import { createGlobalStyle } from "styled-components";

const GlobalStyles = createGlobalStyle`
    
    // *
    * {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        box-sizing: border-box;
        overflow:hidden;
    }

    html{
        overflow-y: visible;
    }

    //scrollbar
    /* width */
    ::-webkit-scrollbar {
        width: 6px;
    }

    /* Track */
    ::-webkit-scrollbar-track {
        background: #fff;
    }

    /* Handle */
    ::-webkit-scrollbar-thumb {
        background: #774dee;
    }

    /* Handle on hover */
    ::-webkit-scrollbar-thumb:hover {
        background: #323232;
    }
`;

export default GlobalStyles;
