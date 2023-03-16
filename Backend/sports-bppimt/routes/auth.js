const express = require("express");
const { check } = require("express-validator");
const router = express.Router();

const { signout, signup, signin, isSignedIn } = require("../controllers/auth");

router.post(
    "/signup",
    [
        check("username")
            .isLength({ min: 5 })
            .withMessage("username should be atleast 5 char"),
        check("password")
            .isLength({ min: 5 })
            .withMessage("password should be atleast 5 char"),
    ],
    signup
);

router.post(
    "/signin",
    [
        check("username")
            .isLength({ min: 1 })
            .withMessage("username field is required"),
        check("password")
            .isLength({ min: 1 })
            .withMessage("password field is required"),
    ],
    signin
);

router.get("/signout", signout);

router.get("/admin", isSignedIn, (req, res) => {
    res.send("A protected");
});

module.exports = router;
