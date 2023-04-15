const System = require("../models/system.model");
const User = require("../models/user.model");

exports.addSystem = async (req, res) => {
  const { serialNumber } = req.body;

  const system = await System.findOne({ serialNumber: serialNumber });

  if (!system) return res.status(404).json({ message: "System not found" });

  const user = await User.findByIdAndUpdate(
    req.user.id,
    { $addToSet: { systems: system.id } },
    { new: true }
  );

  await user.save();

  res.json(user);
};

exports.getSystems = async (req, res) => {
  const user = await User.findById(req.user.id);
  res.json(user.systems);
};
