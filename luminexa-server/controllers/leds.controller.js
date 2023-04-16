const System = require("../models/system.model");

exports.getLeds = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.leds);
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

exports.editLedStatus = async (req, res) => {
  const { systemId, ledId } = req.body;
  const system = await System.findById(systemId);
  const led = system.leds.find((led) => led._id == ledId);

  if (!led) {
    return res.status(404).json({ message: "Led not found" });
  }

  led.ledStatus = led.ledStatus === "on" ? "off" : "on";
  await system.save();
  res.json(led);
};

exports.editLedIntensity = async (req, res) => {
  const { ledId, intensity } = req.body;
  const led = await Led.findById(ledId);
  led.intensity = intensity;
  await led.save();
  res.json(led);
};

exports.editLedColor = async (req, res) => {
  const { ledId, color } = req.body;
  const led = await Led.findById(ledId);
  led.color = color;
  await led.save();
  res.json(led);
};

exports.editLedName = async (req, res) => {
  const { ledId, ledName } = req.body;
  const led = await Led.findById(ledId);
  led.ledName = ledName;
  await led.save();
  res.json(led);
};
