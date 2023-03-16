const Order = require("../models/order");
const { validationResult } = require("express-validator");

exports.createOrder = (req, res) => {
	// create order
	const error = validationResult(req);

	if (!error.isEmpty()) {
		return res.status(422).json({
			error: error.array()[0].msg,
		});
	}

	const order = new Order(req.body);

	order.orderDate = new Date().toISOString;
	order.save((err, order) => {
		if (err) {
			return res.status(400).json({
				err: "Not able to save order in DB",
			});
		}

		res.json(order);
	});
};
exports.deleteOrder = (req, res) => {
	const order = req.order;

	order.remove((err, deleteOrder) => {
		if (err) {
			return res.status(400).json({
				error: "Faild to delete order",
			});
		}
		res.json({
			message: "Deletion was successful",
			deleteOrder,
		});
	});
};

exports.getOrderById = (req, res, next, id) => {
	Order.findById(id).exec((err, order) => {
		if (err) {
			return "Order not found";
		}
		req.order = order;
		next();
	});
};

exports.updateOrder = (req, res) => {
	const order = req.order;
	order.quantity = req.body.quantity;

	order.save((err, updatedOrder) => {
		if (err) {
			return res.status(400).json({
				error: "Failed to update Order",
			});
		}
		res.json({ updatedOrder });
	});
};

exports.updateOrderStatus = (req, res) => {
	const order = req.order;
	order.updateOne({ $set: { status: req.body.status } }, (err, order) => {
		if (err) {
			res.status(400).json({
				error: "Cannot update order status",
			});
		}
		res.json(order);
	});
};

exports.getAllOrdersByDate = (req, res, next, date) => {
	Order.find({ date: date }).exec((err, orders) => {
		if (err) {
			return "Order not found";
		}
		req.ordersByDate = orders;
		next();
	});
};

exports.checkCapacityByDate = (req, res) => {
	let totalQuantity = 0;

	req.ordersByDate.map((order) => {
		totalQuantity += order.quantity;
	});

	res.json({ remainingQuantity: process.env.TOTAL_QUANTITY - totalQuantity });
};
