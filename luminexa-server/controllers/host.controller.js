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

exports.renameLed = async (req, res) => {
  const { systemId, ledId, ledName } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const led = system.leds.find((led) => led._id == ledId);

  if (!led) {
    return res.status(404).json({ message: "Led not found" });
  }

  led.ledName = ledName;

  await system.save();

  res.json(led);
};

exports.systemShutDown = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  system.leds.forEach((led) => {
    led.ledStatus = "off";
    led.intensity = 0;
  });

  system.modes.forEach((mode) => {
    mode.modeStatus == "off";
  });

  system.schedules.forEach((schedule) => {
    schedule.scheduleStatus == "off";
  });

  await system.save();

  res.json(system);
};
