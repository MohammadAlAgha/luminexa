const History = require("../models/history.model");
const System = require("../models/system.model");

exports.createInstance = async (req, res) => {
  const { systemId, ledId, time, intensity, currentConsumption } = req.body;

  const instance = await History.create({
    time,
    intensity,
    currentConsumption,
  }); //saving the instance info

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const led = system.leds.find((led) => led._id == ledId); //finding the LED in that system by ID

  if (!led) {
    return res.status(404).json({ message: "Led not found" });
  } //checking if the LED exists

  led.history.push(instance._id); //saving the new instance of that LED

  await system.save();

  res.json(led);
};
