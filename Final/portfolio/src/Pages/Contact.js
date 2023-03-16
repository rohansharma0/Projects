import React, { useRef } from "react";

import { LocomotiveScrollProvider } from "react-locomotive-scroll";

const Contact = () => {
	const containerRef = useRef(null);
	return (
		<LocomotiveScrollProvider
			options={{
				smooth: true,
				reloadOnContextChange: true,
				// ... all available Locomotive Scroll instance options
			}}
			watch={
				[
					//...all the dependencies you want to watch to update the scroll EXCEPT the location one
				]
			}
		>
			<main data-scroll-container ref={containerRef}>
				<div style={{ height: "200vh" }}>Contact</div>;
			</main>
		</LocomotiveScrollProvider>
	);
};

export default Contact;
