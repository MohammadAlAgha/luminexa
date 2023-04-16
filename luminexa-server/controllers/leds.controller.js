const System = require("../models/system.model");

exports.getLeds = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.leds);
};

exports.editLedStatus = async (req, res) => {
  const { ledId } = req.body;
  const led = await Led.findById(ledId);
  led.ledStatus = led.ledStatus === "on" ? "off" : "on";
  await led.save();
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
