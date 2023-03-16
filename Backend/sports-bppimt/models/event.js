const mongoose = require("mongoose");

const eventSchema = new mongoose.Schema(
    {
        title: {
            type: String,
            required: true,
        },
        discription: {
            type: String,
            required: true,
        },
        type: {
            type: String,
            required: true,
        },
        // time: {
        //     type: Date,
        //     require: true,
        // },
        // registerStartTime: {
        //     type: Date,
        //     require: true,
        // },
        // registerEndTime: {
        //     type: Date,
        //     require: true,
        // },
        // banner: {
        //     type: Buffer,
        //     required: true,
        // },
        // result: {
        //     type: Array,
        //     default: [],
        // },
    },
    { timestamps: true }
);

module.exports = mongoose.model("Event", eventSchema);
