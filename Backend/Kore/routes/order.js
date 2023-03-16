const express = require("express");
const router = express.Router();

const {
	createOrder,
	deleteOrder,
	getOrderById,
	updateOrder,
	updateOrderStatus,
	getAllOrdersByDate,
	checkCapacityByDate,
} = require("../controllers/order");

//params
router.param("orderId", getOrderById);
router.param("date", getAllOrdersByDate);

//add new order
router.post("/add", createOrder);

// update order
router.put("/update/:orderId", updateOrder);
router.put("/updateStatus/:orderId", updateOrderStatus);

//delete order
router.delete("/delete/:orderId", deleteOrder);

//get
router.get("/checkCapacity/:date", checkCapacityByDate);

module.exports = router;
