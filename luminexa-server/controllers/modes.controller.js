const Mode = require("../models/mode.model");
const System = require("../models/system.model");

exports.getModes = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.modes);
};

exports.setModeStatus = async (req, res) => {
  const { modeId } = req.body;
  const mode = await Mode.findById(modeId);
  mode.modeStatus = mode.modeStatus === "on" ? "off" : "on";
  await mode.save();
  res.json(mode);
};
