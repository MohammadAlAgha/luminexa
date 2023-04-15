const Led = require("../models/led.model");
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
