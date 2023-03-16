import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Header from "./components/Header";
import GlobalStyles from "./components/styles/Global";
import About from "./Pages/About";
import Contact from "./Pages/Contact";
import Home from "./Pages/Home";

const Router = () => {
	return (
		<BrowserRouter>
			<GlobalStyles />
			<Header />
			<Switch>
				<Route path="/" exact component={Home} />
				<Route path="/contact" exact component={Contact} />
				<Route path="/about" exact component={About} />
			</Switch>
		</BrowserRouter>
	);
};

export default Router;
