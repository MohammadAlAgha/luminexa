const System = require("../models/system.model");

exports.getModes = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.modes);
};

exports.addMode = async (req, res) => {
  const { systemId, modeName } = req.body;
  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const leds = system.leds;

  const mode = {
    modeName,
    leds,
  };

  system.modes.push(mode);

  await system.save();

  res.json(system);
};

exports.applyMode = async (req, res) => {
  const { systemId, modeId } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const mode = system.modes.find((mode) => mode._id == modeId);

  if (!mode) {
    return res.status(404).json({ message: "Mode not found" });
  }

  const notMode = system.modes.find((mode) => mode._id !== modeId);

  system.modes.forEach((notMode) => {
    if (notMode._id !== modeId) {
      notMode.modeStatus = "off";
    }
  });

  mode.modeStatus = "on";

  system.leds = mode.leds;

  await system.save();

  res.json(system);
};

exports.toggleMode = async (req, res) => {
  const { systemId, modeId } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const mode = system.modes.find((mode) => mode._id == modeId);

  if (!mode) {
    return res.status(404).json({ message: "Mode not found" });
  }

  mode.modeStatus = mode.modeStatus == "on" ? "off" : "on";

  await system.save();

  res.json(system);
};
