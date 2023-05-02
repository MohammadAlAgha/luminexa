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

  led.ledConfig.ledStatus = led.ledConfig.ledStatus == "on" ? "off" : "on"; //toggling the LED status from on to off or from off to on

  const config = system.lastManual.find((config) => config.leds._id == ledId); //finding the config with the same LED ID

  config.ledStatus = led.ledConfig.ledStatus; //Updating the config with the same actual led config

  await system.save();

  res.json(system);
};

exports.addLed = async (req, res) => {
  const { systemId, ledName } = req.body;

  const led = {
    ledName: ledName,
  }; //creating  a new led

  const system = await System.findById(systemId); //finding the mode in that system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  system.leds.push(led); //Adding the LED to the group of LEDs in that system

  await system.save();
  const newLed = system.leds[system.leds.length - 1]; // Get the last LED in the array (which is the newly added LED)

  const ledConfig = {
    leds: newLed._id, // Use the new LED's ID
  };

  const history = []; //Creating an empty history since it is new LED

  const newLedObject = {
    ledName: ledName,
    ledConfig: ledConfig,
    history: history,
  }; //Creating a new led object to that has the last LED id

  system.lastManual.push(newLedObject.ledConfig); //updating the system manula

  system.leds.forEach((led) => {
    if (led.id == newLed.id) {
      led.ledConfig = ledConfig;
    }
  });
  //updating the led initial configuration

  await system.save();

  res.json(system);
};

exports.editLed = async (req, res) => {
  const { systemId, ledId, intensity, color } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json("System not found");
  } //checking if system exists

  const config = system.lastManual.find((config) => config.leds._id == ledId); //finding the LED in that system by ID

  if (!config) {
    return res.status(404).json({ message: "Led not found" });
  } //checking if LED exists

  config.intensity = intensity; //updating the LED intensity
  config.color = color; //updating the LED color

  await system.save();

  res.json(config);
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
    if (led.ledConfig.ledStatus == "on") {
      activeLeds.push(led);
    }
  }); //getting only the on LEDs

  res.json(activeLeds);
};
