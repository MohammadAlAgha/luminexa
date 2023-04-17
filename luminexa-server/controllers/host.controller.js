const System = require("../models/system.model");

exports.getSystemUsers = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId).populate({
    path: "users",
    select: "-password",
  });

  res.json(system.users);
};

exports.renameSystem = async (req, res) => {
  const { systemId, systemName } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  system.systemName = systemName;

  await system.save();

  res.json(system);
};
