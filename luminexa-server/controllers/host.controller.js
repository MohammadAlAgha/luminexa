const System = require("../models/system.model");
const User = require("../models/user.model");

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

exports.addUser = async (req, res) => {
  const { systemId, email } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const user = await User.findOne({ email }); //finding the user by email

  if (!user) {
    return res.status(400).json({ message: "Wrong email" });
  } //checking if the email exist

  const userIndex = system.users.indexOf(user._id); //searching for the index of the user ID in the array of users

  if (userIndex !== -1) {
    return res
      .status(400)
      .json({ message: "This user is already added in this system" });
  } //checking if the user is already in the system

  system.users.push(user.id); //adding the user to the list of users in the system
  user.systems.push(systemId); //adding the system to the list of systems for that user

  await system.save();
  await user.save();

  res.json(system.users);
};

exports.deleteUser = async (req, res) => {
  const { systemId, email } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const user = await User.findOne({ email }); //finding the user by email

  if (!user) {
    return res.status(400).json({ message: "Wrong email" });
  } //checking if the email exist

  const userIndex = system.users.indexOf(user._id); //searching for the index of the user ID in the array of users

  if (userIndex === -1) {
    return res.status(400).json({ message: "This user is not in this system" });
  } //checking if the user is already in the system

  const updatedSystem = [];
  const updatedUser = [];

  system.users.forEach((oneUser) => {
    if (!(oneUser.valueOf() == user._id)) {
      updatedSystem.push(oneUser);
    }
  }); //removing the user ID from the array of users in the system

  user.systems.forEach((oneSystem) => {
    if (!(oneSystem.valueOf() == systemId)) {
      updatedUser.push(oneSystem);
    }
  }); //removing the system ID from the array of systems for that user

  system.users = updatedSystem; //updating the users array in the system
  user.systems = updatedUser; //updating the systems array for the user

  await system.save();
  await user.save();

  res.json(system.users);
};

exports.setHost = async (req, res) => {
  const { systemId, userEmail } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const user = await User.findOne({ userEmail }); //finding the user by email

  if (!user) {
    return res.status(400).json({ message: "Wrong email" });
  } //checking if the email exist

  const userIndex = system.users.indexOf(user._id); //searching for the index of the user ID in the array of users

  if (userIndex === -1) {
    return res.status(400).json({ message: "This user is not in this system" });
  } //checking if the user is already in the system

  system.hosts.push(user); //adding the user to the sets of hosts in that system

  await system.save();

  res.json(system.hosts);
};
