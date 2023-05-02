const System = require("../models/system.model");

exports.getModes = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  res.json(system.modes);
};

exports.addMode = async (req, res) => {
  const { systemId, modeName } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const leds = system.leds; //getting the system current leds status
  const originalConfigs = system.lastManual; //getting the system current leds status

  const configurations = [];

  leds.forEach((led) => {
    configurations.push(led.ledConfig);
  });

  const mode = {
    modeName,
    leds: configurations,
  }; //setting the mode based on the leds status

  system.modes.push(mode); //adding the new mode to the list of modes in this system

  leds.forEach((led) => {
    originalConfigs.forEach((config) => {
      if (led.id == config.leds) {
        led.ledConfig = config;
      }
    });
  });
  //retrieved the old status of the leds

  await system.save();

  res.json(system);
};

exports.toggleMode = async (req, res) => {
  const { systemId, modeId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const mode = system.modes.find((mode) => mode._id == modeId); //finding the mode in that system by ID

  if (!mode) {
    return res.status(404).json({ message: "Mode not found" });
  } //checking if the mode exists

  mode.modeStatus = mode.modeStatus == "on" ? "off" : "on"; //toggling the mode from on to off or from off to on

  const leds = system.leds; //getting the systems leds
  const originalConfigs = system.lastManual; //getting the system current leds last manual

  if (mode.modeStatus == "on") {
    leds.forEach((led) => {
      mode.leds.forEach((config) => {
        if (led.id == config.leds) {
          led.ledConfig = config;
        }
      });
    }); //setting the leds status to match the saved leds status in the applied mode
  } else {
    leds.forEach((led) => {
      originalConfigs.forEach((config) => {
        if (led.id == config.leds) {
          led.ledConfig = config;
        }
      });
    });
    //retrieved the old status of the leds
  }

  await system.save();

  res.json(system);
};

exports.updateMode = async (req, res) => {
  const { systemId, modeId, modeName } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const mode = system.modes.find((mode) => (mode._id = modeId)); //finding the mode in that system by ID

  if (!mode) {
    return res.status(404).json({ message: "Mode not found" });
  } //checking if the mode exists

  mode.modeName = modeName; //updating mode name
  mode.leds = system.leds; //updating the leds status

  system.lastManual = system.leds; //saving the latest manual before updating mode

  await system.save();

  res.json(system);
};
