require("dotenv").config();

const express = require("express");
const mongoose = require("mongoose");

const app = express();

const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const cors = require("cors");

const orderRoutes = require("./routes/order");

//Middlewares
app.use(bodyParser.json());
app.use(cookieParser());
app.use(cors());

//My routes
app.use("/api", orderRoutes);

//DB connections
mongoose.connect(process.env.DATABASE);

//Port
const port = process.env.PORT || 8000;

app.listen(port);
