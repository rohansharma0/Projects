import React, { useState } from "react";

// react-router-dom
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Home from "./pages/Home";
import LoginScreen from "./pages/Admin/LoginScreen";
import Products from "./pages/Products";
import About from "./pages/About";
import PageNotFound from "./pages/PageNotFound";
import Dashboard from "./pages/Admin/Dashboard";
import { UserContext } from "./Context/UserContext";
import FirebaseConfig from "./utils/FirebaseConfig";

// css
import "./static/css/style.css";

//firebase
import firebase from "firebase/app";
import "firebase/auth";

// init firebase
firebase.initializeApp(FirebaseConfig);

const App = () => {
  const [user, setUser] = useState(null);

  return (
    <Router>
      <UserContext.Provider value={{ user, setUser }}>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/products" component={Products} />
          <Route exact path="/about" component={About} />
          <Route exact path="/admin" component={LoginScreen} />
          <Route exact path="/dashboard" component={Dashboard} />
          <Route exact component={PageNotFound} />
        </Switch>
      </UserContext.Provider>
    </Router>
  );
};

export default App;
