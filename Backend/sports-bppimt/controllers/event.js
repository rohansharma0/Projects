const Event = require("../models/event");

exports.addEvent = (req, res) => {};

exports.updateEvent = (req, res) => {
    Event.findByIdAndUpdate(
        { _id: req.profile._id },
        { $set: req.body },
        { new: true },
        (err, event) => {
            if (err || !event) {
                return res.status(400).json({
                    error: "You are not authorized to update this event",
                });
            }

            res.json(event);
        }
    );
};

exports.getEventById = (req, res, next, id) => {
    Event.findById(id).exec((err, event) => {
        if (err || !event) {
            return res.status(400).json({
                error: "No event was found in DB",
            });
        }

        req.profile = event;
        next();
    });
};

exports.getEvent = (req, res) => {
    return res.json(req.profile);
};

exports.getAllEvents = (req, res) => {
    Event.find().exec((err, events) => {
        if (err || !events) {
            return res.status(400).json({
                error: "No event was found in DB",
            });
        }
        res.json(events);
    });
};
