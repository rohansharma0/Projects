import React, { useContext, useState } from "react";

//react-router-dom
import { Redirect } from "react-router-dom";
// firebase
import firebase from "firebase/app";

import { UserContext } from "../../Context/UserContext";

const LoginForm = () => {
  const context = useContext(UserContext);

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [errorMessage, setErrorMessage] = useState("");

  const handleLogin = () => {
    firebase
      .auth()
      .signInWithEmailAndPassword(email, password)
      .then((res) => {
        console.log(res);
        context.setUser({ email: res.user.email, uid: res.user.uid });
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (
      email === "" ||
      !email.endsWith("@gmail.com") ||
      email.startsWith("@")
    ) {
      setErrorMessage("Please enter a valid email.");
    } else {
      if (password.length < 6 || password === "") {
        setErrorMessage("Please enter correct password.");
      } else {
        handleLogin();
      }
    }
  };

  if (context.user?.uid) {
    return <Redirect to="/dashboard" />;
  }
  return (
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label for="email">Email</label>
        <input
          type="email"
          id="email"
          className="form-control"
          placeholder="email@example.com"
          value={email}
          onChange={(e) => {
            setEmail(e.target.value);
            setErrorMessage("");
          }}
        />
      </div>
      <div className="form-group mb-4">
        <label for="password">Password</label>
        <input
          type="password"
          id="password"
          className="form-control"
          placeholder="********"
          value={password}
          onChange={(e) => {
            setPassword(e.target.value);
            setErrorMessage("");
          }}
        />
      </div>
      <p className="text-danger mb-4">{errorMessage}</p>

      <button className="btn btn-block login-btn" type="submit">
        Login
      </button>
    </form>
  );
};

export default LoginForm;
