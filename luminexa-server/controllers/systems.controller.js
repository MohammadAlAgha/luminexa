const System = require("../models/system.model");

exports.addSystem = async (req, res) => {
  const { name, serial_number } = req.body;

  const system = await System.findOne({ serial_number });

  if (!system) return res.status(404).json({ message: "System not found" });
};
