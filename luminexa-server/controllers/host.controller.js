const System = require("../models/system.model");

exports.getSystemUsers = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId).populate({
    path: "users",
    select: "-password",
  }); //getting all the users detailes to the host except the password

  res.json(system.users);
};

exports.renameSystem = async (req, res) => {
  const { systemId, systemName } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  system.systemName = systemName; //updating the system name

  await system.save();

  res.json(system);
};

exports.renameLed = async (req, res) => {
  const { systemId, ledId, ledName } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const led = system.leds.find((led) => led._id == ledId); //finding the LED in that system by ID

  if (!led) {
    return res.status(404).json({ message: "Led not found" });
  } //checking if LED exists

  led.ledName = ledName; //updating the LED name

  await system.save();

  res.json(led);
};

exports.systemShutDown = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  system.leds.forEach((led) => {
    led.ledStatus = "off";
    led.intensity = 0;
  }); //turning every single LED off and updating the intensity to be 0

  system.modes.forEach((mode) => {
    mode.modeStatus == "off";
  }); //turning all the modes off

  system.schedules.forEach((schedule) => {
    schedule.scheduleStatus == "off";
  }); //turning all the schedules off

  await system.save();

  res.json(system);
};
