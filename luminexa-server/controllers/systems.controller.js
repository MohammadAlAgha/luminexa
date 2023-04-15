const System = require("../models/system.model");
const User = require("../models/user.model");

exports.addSystem = async (req, res) => {
  const { systemSerial, systemName } = req.body;

  const system = await System.findOne({ serial_number: systemSerial });

  if (!system) return res.status(404).json({ message: "System not found" });

  const userSystem = {
    system: system._id,
    systemName,
  };

  const user = await User.findByIdAndUpdate(req.user.id, {
    $push: { systems: userSystem },
  });

  res.json(user);
};
