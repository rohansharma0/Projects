import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import GlobalStyles from "./components/styles/Global";
import Cursor from "./Helper/Cursor";
import About from "./Pages/About";
import Base from "./Pages/Base";
import Contact from "./Pages/Contact";
import Home from "./Pages/Home";

const Router = () => {
	return (
		<BrowserRouter>
			<GlobalStyles />
			<Base />
			<Cursor />
			<Switch>
				<Route path="/" exact component={Home} />
				<Route path="/contact" exact component={Contact} />
				<Route path="/about" exact component={About} />
			</Switch>
		</BrowserRouter>
	);
};

export default Router;
