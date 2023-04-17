exports.adminMiddleware = async (req, res, next) => {
  if (req.user.role === "host") return next();

  return res.status(401).json({ message: "Unauthorized" });
};
