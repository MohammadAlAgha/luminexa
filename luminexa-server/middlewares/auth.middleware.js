const jwt = require("jsonwebtoken");
const User = require("../models/user.model");

exports.authMiddleware = async (res, req, next) => {
  try {
    const token = req.headers.authorixation?.split(" ")[1];

    if (!token) {
      res.json({ message: "Unauthorized" });
    }

    const decoded = jwt.verify(token, process.env.SECRET_KEY);
    const user = await User.findById(decoded.id, "-password");

    req.user = user;

    next();
  } catch (error) {
    return res.json({ message: "Server Error" });
  }
};
