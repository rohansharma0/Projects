import React, { useState } from "react";

//firebase
import firebase from "firebase";

const ContactForm = () => {
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [message, setMessage] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const [successMessage, setSuccessMessage] = useState("");

  const handleSubmit = () => {
    if (name === "") {
      setErrorMessage("Please enter your name.");
    } else {
      if (
        email === "" ||
        !email.endsWith("@gmail.com") ||
        email.startsWith("@")
      ) {
        setErrorMessage("Please enter a valid email.");
      } else {
        if (message === "") {
          setErrorMessage("Please enter your message.");
        } else {
          try {
            firebase
              .firestore()
              .collection("messages")
              .doc()
              .set({
                name,
                email,
                message,
                //TODO: date
              })
              .then(() => {
                //TODO: timer send successfully & change to sucess message
                setSuccessMessage("Send successfully.");
                setEmail("");
                setName("");
                setMessage("");
                setErrorMessage("");
              });
          } catch (error) {
            // TODO: error handle
            console.log(error);
          }
        }
      }
    }
  };

  return (
    <div className="contact__form">
      <p>
        Get in<span>Touch</span>
      </p>
      <div className="form__container">
        <div className="form__content">
          <div className="input__container">
            <label for="Name" className="input__label">
              Name
            </label>
            <input
              type="text"
              id="Name"
              className="text__input"
              value={name}
              onChange={(e) => {
                setName(e.target.value);
                setErrorMessage("");
                setSuccessMessage("");
              }}
            />
          </div>
          <div className="input__container">
            <label for="Email" className="input__label">
              Email
            </label>
            <input
              type="email"
              id="Email"
              className="text__input"
              value={email}
              onChange={(e) => {
                setEmail(e.target.value);
                setErrorMessage("");
                setSuccessMessage("");
              }}
            />
          </div>
        </div>
        <div className="form__content">
          <div className="input__container">
            <label for="Text" className="input__label">
              Message
            </label>
            <textarea
              id="Text"
              className="message__input"
              value={message}
              onChange={(e) => {
                setMessage(e.target.value);
                setErrorMessage("");
                setSuccessMessage("");
              }}
            ></textarea>
          </div>
        </div>
      </div>
      <p className="error__message">{errorMessage}</p>
      <p className="success__message">{successMessage}</p>
      <button onClick={handleSubmit} className="send__button">
        SEND
      </button>
    </div>
  );
};

export default ContactForm;
