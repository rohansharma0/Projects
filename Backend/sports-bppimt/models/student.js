const mongoose = require("mongoose");
const { ObjectId } = mongoose.Schema;
const uuidv1 = require("uuid/v1");

const studentSchema = mongoose.Schema(
    {
        collegeId: {
            type: String,
            required: true,
        },
        name: {
            type: String,
            required: true,
        },
        eventId: {
            type: ObjectId,
            ref: "Event",
        },
    },
    { timestamps: true }
);

module.exports = mongoose.model("Student", studentSchema);
