const mongoose = require("mongoose");

const orderSchema = new mongoose.Schema(
	{
		quantity: {
			type: Number,
			required: true,
		},
		status: {
			type: String,
			default: "placed",
			enum: ["placed", "packed", "dispatched", "delivered"],
		},
		orderDate: {
			type: Date,
		},
	},
	{ timestamps: true },
);

module.exports = mongoose.model("Order", orderSchema);
