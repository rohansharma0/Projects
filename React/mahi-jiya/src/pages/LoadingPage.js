import React from "react";
import LoadingLogo from "../static/images/loading.svg";

const LoadingPage = () => {
  return (
    <div className="loading-container">
      <div className="loading">
        <img src={LoadingLogo} alt="loading" />
      </div>
    </div>
  );
};

export default LoadingPage;
