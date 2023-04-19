const jwt = require("jsonwebtoken");
const User = require("../models/user.model");

exports.authMiddleware = async (req, res, next) => {
  try {
    const token = req.headers.authorization?.split(" ")[1]; //Getting only the token from the headers

    if (!token) {
      return res.status(403).json({ message: "Unauthenticated" });
    } //Checking if the token exists

    const decoded = jwt.verify(token, process.env.SECRET_KEY); //decoding the user ID and email from the token
    const user = await User.findById(decoded.id, "-password"); //getting the user info by the decoded ID without the password

    req.user = user;

    next();
  } catch (e) {
    return res.status(500).json({ message: "Server Error" });
  }
};
