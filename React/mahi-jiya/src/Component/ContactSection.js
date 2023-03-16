import React from "react";

import ContactForm from "./ContactForm";

const ContactSection = () => {
  return (
    <div className="contact__section" id="contact">
      <div className="parallax">
        <div className="parallax__image"></div>
      </div>
      <div className="contact__container">
        <ContactForm />
      </div>
    </div>
  );
};

export default ContactSection;
