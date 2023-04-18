const History = require("../models/history.model");
const System = require("../models/system.model");

exports.createInstance = async (req, res) => {
  const { systemId, ledId, time, intensity, currentConsumption } = req.body;

  const instance = await History.create({
    time,
    intensity,
    currentConsumption,
  });

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const led = system.leds.find((led) => led._id == ledId);

  if (!led) {
    return res.status(404).json({ message: "Led not found" });
  }

  led.history.push(instance._id);

  await system.save();

  res.json(led);
};
