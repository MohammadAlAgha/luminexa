exports.hostMiddleware = async (req, res, next) => {
  if (req.user.userType === "host") return next();

  return res.status(401).json({ message: "Unauthorized" });
};
