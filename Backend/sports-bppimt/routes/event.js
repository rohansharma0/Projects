const express = require("express");
const router = express.Router();

const {
	getEventById,
	getEvent,
	getAllEvents,
	updateEvent,
} = require("../controllers/event");

const { isSignedIn, isAuthenticated } = require("../controllers/auth");

router.param("eventId", getEventById);

router.get("/event/:eventId", getEvent);

router.get("/events", getAllEvents);

router.put("/event/:eventId", isSignedIn, isAuthenticated, updateEvent);

module.exports = router;
