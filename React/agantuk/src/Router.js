import React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import App from "./App";
import Donation from "./components/Donation";
import GlobalStyles from "./components/styles/Global";
export default function Router() {
    return (
        <BrowserRouter>
            <GlobalStyles />
            <Routes>
                <Route path="/" element={<App />} />
                <Route path="/donations" element={<Donation />} />
                <Route path="/stories" element={<Donation />} />
                <Route path="/donations" element={<Donation />} />
                <Route path="/donations" element={<Donation />} />
                <Route
                    path="*"
                    element={
                        <main style={{ padding: "1rem" }}>
                            <p>There's nothing here!</p>
                        </main>
                    }
                />
            </Routes>
        </BrowserRouter>
    );
}
