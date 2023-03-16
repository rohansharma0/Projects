import React, { useState } from "react";

import "../../static/css/login.css";
import Logo from "../../static/images/logo.svg";
import LoginImg from "../../static/images/login.jpg";

import LoginForm from "../../Component/Admin/LoginForm";
import ResetForm from "../../Component/Admin/ResetForm";

const LoginScreen = () => {
  const [isLoginForm, setIsLoginForm] = useState(true);

  const toggleLoginForm = () => {
    setIsLoginForm(!isLoginForm);
  };
  return (
    <div className="container-fluid">
      <div className="row">
        <div className="col-sm-6 login-section-wrapper">
          <div className="brand-wrapper">
            <img src={Logo} alt="logo" className="logo" />
          </div>
          <div className="login-wrapper my-auto">
            <h1 className="login-title">
              {isLoginForm ? "Log in" : "Forgot Password"}
            </h1>
            {isLoginForm ? <LoginForm /> : <ResetForm />}
            <a
              href="#"
              className="forgot-password-link"
              onClick={toggleLoginForm}
            >
              {isLoginForm ? "Forgot password?" : "Log in"}
            </a>
          </div>
        </div>
        <div className="col-sm-6 px-0 d-none d-sm-block">
          <img src={LoginImg} alt="login image" className="login-img" />
        </div>
      </div>
    </div>
  );
};

export default LoginScreen;
