const System = require("../models/system.model");

exports.getModes = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.modes);
};
