require("dotenv").config();

const express = require("express");
const mongoose = require("mongoose");

const app = express();

const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const cors = require("cors");

const authRoutes = require("./routes/auth");
const eventRoutes = require("./routes/event");

//Middlewares
app.use(bodyParser.json());
app.use(cookieParser());
app.use(cors());

//My Routes
app.use("/api", authRoutes);
app.use("/api", eventRoutes);

//DB Connection
mongoose.connect(process.env.DATABASE);

//Port
const port = process.env.PORT || 8000;

app.listen(port);
