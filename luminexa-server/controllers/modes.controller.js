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

  const mode = {
    modeName,
    leds,
  }; //setting the mode based on the leds status

  system.modes.push(mode); //adding the new mode to the list of modes in this system

  system.leds = system.lastManual; //retrieved the old status of the leds

  await system.save();

  res.json(system);
};

exports.applyMode = async (req, res) => {
  const { systemId, modeId } = req.body;

  const system = await System.findById(systemId); //finding the schedule in that system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const mode = system.modes.find((mode) => mode._id == modeId); //finding the mode in that system by ID

  if (!mode) {
    return res.status(404).json({ message: "Mode not found" });
  } //checking if the mode exists

  const notMode = system.modes.find((mode) => mode._id !== modeId); //getting all the non applied modes

  system.modes.forEach((notMode) => {
    if (notMode._id !== modeId) {
      notMode.modeStatus = "off";
    }
  }); //makeing sure all the non applied modes are off

  mode.modeStatus = "on"; //setting the applied mode as on

  system.lastManual = system.leds; //saving the latest manual before adding mode

  system.leds = mode.leds; //setting the leds status to match the saved leds status in the applied mode

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

  if (mode.modeStatus == "off") {
    system.leds = system.lastManual; //Set the modes back to the old status after the mode is off
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
