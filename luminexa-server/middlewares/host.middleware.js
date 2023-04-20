const System = require("../models/system.model");

exports.hostMiddleware = async (req, res, next) => {
  const systemId = req.body.systemId;

  const system = await System.findById(systemId);
  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const userId = req.user._id;
  if (system.hosts.includes(userId)) {
    return next();
  } else {
    return res.status(401).json({ message: "Unauthorized" });
  }
};
