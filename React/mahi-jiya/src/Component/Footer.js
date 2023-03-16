import React, { useEffect, useState } from "react";

// static files
import fbLogo from "../static/images/facebook.svg";
import igLogo from "../static/images/instagram.svg";
import linkedinLogo from "../static/images/linkedin.svg";
import twitterLogo from "../static/images/twitter.svg";

const Footer = () => {
  return (
    <div className="footer">
      <div className="left__footer">
        <h1>Mahi and Jiya Interiors</h1>
        <h4>Deepak Sharma</h4>
        <p>mahiandjiyainteriors@gmail.com</p>
        <p>(+91) 9108274785</p>
      </div>
      <div className="center__footer">
        <p>NO 41/2/2 BASAVANAPURA VILLAGE BANNERGHATTA MAIN ROAD</p>
        <p>BANGALORE</p>
        <p>Karnataka 560083</p>
        <p>Copyright 2020 ©</p>
      </div>
      <div className="right__footer">
        <p>STAY CONNECTED</p>
        <div className="footer__logo__container">
          <a href="https://www.instagram.com/mahiandjiyainteriors">
            <img src={igLogo} alt="instagram" />
          </a>
          <a href="https://twitter.com/DeepakS65513050">
            <img src={twitterLogo} alt="twitter" />
          </a>
          <a href="https://www.facebook.com/mahiandjiyainteriors">
            <img src={fbLogo} alt="facebook" />
          </a>
          <a href="https://www.linkedin.com/in/deepak-sharma-61675a202">
            <img src={linkedinLogo} alt="linkedin" />
          </a>
        </div>

        <p>
          Created by{" "}
          <a href="https://www.instagram.com/rohan__sharma0/">ROHAN SHARMA</a>
        </p>
      </div>
    </div>
  );
};

export default Footer;
