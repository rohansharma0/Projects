import React, { useEffect, useRef, useState } from "react";
import { BrowserRouter, Route, Switch, useLocation } from "react-router-dom";
import GlobalStyles from "./components/styles/Global";
import Cursor from "./Helper/Cursor";
import About from "./Pages/About";
import Contact from "./Pages/Contact";

import Home from "./Pages/Home";
import Background from "./Pages/Background";
import Test from "./Pages/Test";
import LoadingScreen from "./Pages/LoadingScreen";
import NavBar from "./components/NavBar";

import "locomotive-scroll/dist/locomotive-scroll.css";

const Router = () => {
	const [preloader, setPreloader] = useState(true);
	const [timer, setTimer] = useState(1);
	const id = useRef(null);

	const clear = () => {
		window.clearInterval(id.current);
		setPreloader(false);
	};

	useEffect(() => {
		id.current = window.setInterval(() => {
			setTimer((timer) => timer - 1);
		}, 500);
	}, []);

	useEffect(() => {
		if (timer === 0) {
			clear();
		}
	}, [timer]);

	return (
		<BrowserRouter>
			<GlobalStyles />
			<Background />
			<Cursor />
			{preloader ? (
				<LoadingScreen />
			) : (
				<>
					<NavBar />
					<div id="wrapper">
						<Switch>
							<Route path="/" exact component={Home} />
							<Route path="/about" exact component={About} />
							<Route path="/contact" exact component={Contact} />
						</Switch>
					</div>
					{/* <Route path="/" exact component={Test} /> */}
				</>
			)}
		</BrowserRouter>
	);
};

export default Router;
