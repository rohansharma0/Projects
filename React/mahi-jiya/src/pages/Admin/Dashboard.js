import React, { useContext } from "react";

import { UserContext } from "../../Context/UserContext";

//firebase
import firebase from "firebase/app";
import { Redirect } from "react-router-dom";

const Dashboard = () => {
  const context = useContext(UserContext);

  const handleLogout = () => {
    context.setUser(null);
    firebase.auth().signOut();
  };

  if (!context.user?.uid) {
    return <Redirect to="/admin" />;
  }

  return (
    <div>
      <h1>{context.user?.email ? context.user.email : "Not login"}</h1>
      <button onClick={handleLogout}>Logout</button>
    </div>
  );
};

export default Dashboard;
