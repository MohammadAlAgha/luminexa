const System = require("../models/system.model");

exports.getLeds = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  res.json(system.leds);
};

exports.editLedStatus = async (req, res) => {
  const { systemId, ledId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const led = system.leds.find((led) => led._id == ledId); //finding the LED in that system by ID

  if (!led) {
    return res.status(404).json({ message: "Led not found" });
  } //checking if LED exists

  led.ledStatus = led.ledStatus == "on" ? "off" : "on"; //toggling the LED status from on to off or from off to on

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
  }; //Saving the LED info

  const system = await System.findById(systemId); //finding the mode in that system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  system.leds.push(led); //Adding the LED to the group of LEDs in that system
  system.lastManual.push(led); //Saving the last LED status in case of reverting changes or turning off all modes or schedule time out

  await system.save();

  res.json(system);
};

exports.editLed = async (req, res) => {
  const { systemId, ledId, intensity, color } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json("System not found");
  } //checking if system exists

  const led = system.leds.find((led) => led._id == ledId); //finding the LED in that system by ID

  led.intensity = intensity; //updating the LED intensity
  led.color = color; //updating the LED color

  await system.save();

  res.json(led);
};

exports.getActiveLeds = async (req, res) => {
  const { systemId } = req.body;

  const activeLeds = []; //creating an empty array to collect the active LEDs

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const leds = system.leds; //finding the LED in that system by ID

  leds.forEach((led) => {
    if (led.ledStatus == "on") {
      activeLeds.push(led);
    }
  }); //getting only the on LEDs

  res.json(activeLeds);
};
