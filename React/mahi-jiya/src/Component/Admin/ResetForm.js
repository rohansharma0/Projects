import React, { useState } from "react";

// firebase
import firebase from "firebase/app";

const ResetForm = () => {
  const [email, setEmail] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const [successMessage, setSuccessMessage] = useState("");

  const handleLogin = () => {
    firebase
      .auth()
      .sendPasswordResetEmail(email)
      .then((res) => {
        console.log(res);
        setSuccessMessage("Email send successfully.");
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
      handleLogin();
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="form-group">
        <label for="email">Email</label>
        <input
          type="email"
          name="email"
          id="email"
          className="form-control"
          placeholder="email@example.com"
          value={email}
          onChange={(e) => {
            setEmail(e.target.value);
            setErrorMessage("");
            setSuccessMessage("");
          }}
        />
      </div>
      <p className="text-danger mb-4">{errorMessage}</p>
      <p className="text-success mb-4">{successMessage}</p>

      <button className="btn btn-block login-btn" type="submit">
        Reset
      </button>
    </form>
  );
};

export default ResetForm;
