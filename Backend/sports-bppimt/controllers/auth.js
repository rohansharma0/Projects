const jwt = require("jsonwebtoken");
const expressJwt = require("express-jwt");

const { validationResult } = require("express-validator");
const User = require("../models/user");

exports.signout = (req, res) => {
    res.clearCookie("token");

    res.json({
        message: "User signout successfully",
    });
};
exports.signup = (req, res) => {
    const error = validationResult(req);

    if (!error.isEmpty()) {
        return res.status(422).json({
            error: error.array()[0].msg,
        });
    }

    const user = new User(req.body);
    user.save((err, user) => {
        if (err) {
            return res.status(400).json({
                err: "Not able to save user in DB",
            });
        }

        res.json({
            username: user.username,
            id: user._id,
        });
    });
};
exports.signin = (req, res) => {
    const { username, password } = req.body;

    const error = validationResult(req);

    if (!error.isEmpty()) {
        return res.status(422).json({
            error: error.array()[0].msg,
        });
    }

    User.findOne({ username }, (err, user) => {
        if (err || !user) {
            return res.status(400).json({
                error: "User email does not exists",
            });
        }

        if (!user.autheticate(password)) {
            return res.status(401).json({
                error: "Email and password does not match",
            });
        }

        //create token
        const token = jwt.sign({ _id: user._id }, process.env.SECRET);

        //put token in cookie
        res.cookie("token", token, { expire: new Date() + 9999 });

        //send res to front end
        const { _id, username } = user;
        return res.json({ token, user: { _id, username } });
    });
};

//protected routes
exports.isSignedIn = expressJwt({
    secret: process.env.SECRET,
    algorithms: ["HS256"],
    userProperty: "auth",
});

//custom middlewares

exports.isAuthenticated = (req, res, next) => {
    let checker = req.profile && req.auth && req.profile._id == req.auth._id;
    if (!checker) {
        return res.status(403).json({
            error: "Access denied",
        });
    }
    next();
};
