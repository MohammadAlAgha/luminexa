const System = require("../models/system.model");

exports.getLeds = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  res.json(system.leds);
};

exports.editLedStatus = async (req, res) => {
  const { systemId, ledId } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const led = system.leds.find((led) => led._id == ledId);

  if (!led) {
    return res.status(404).json({ message: "Led not found" });
  }

  led.ledStatus = led.ledStatus == "on" ? "off" : "on";

  await system.save();
  res.json(led);
};

exports.addLed = async (req, res) => {
  const { systemId, ledName, ledStatus, intensity, color } = req.body;

  const led = {
    ledName,
    ledStatus,
    intensity,
    color,
  };

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  system.leds.push(led);

  await system.save();

  res.json(system);
};

exports.editLed = async (req, res) => {
  const { systemId, ledId, ledName, intensity, color } = req.body;
  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json("System not found");
  }

  const led = system.leds.find((led) => led._id == ledId);

  led.ledName = ledName;
  led.intensity = intensity;
  led.color = color;

  await system.save();

  res.json(led);
};
