const System = require("../models/system.model");
const User = require("../models/user.model");

exports.getSystemUsers = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId).populate({
    path: "users",
    select: "-password -systems -notifications",
  }); //getting all the users detailes to the host except the password,systems and notifications

  const users = system.users.map((user) => {
    const isHosts = system.hosts.includes(user._id.toString());
    return {
      ...user.toJSON(),
      isHosts,
    };
  }); //iterating over the users then checking if they are in the hosts list

  res.json(users);
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

  const system = await System.findById(systemId).populate({
    path: "users",
    select: "-password -systems -notifications",
  }); //getting all the users details to the host except the password,systems and notifications

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

  const updatedSystem = await System.findById(systemId).populate({
    path: "users",
    select: "-password -systems -notifications",
  }); //fetching the system object again to update the isHost property for all users

  updatedSystem.users.forEach((systemUser) => {
    systemUser.isHosts = systemUser._id.equals(system.hosts); //updating the isHost property for all users
  });

  res.json(updatedSystem.users);
};

exports.deleteUser = async (req, res) => {
  const { systemId, email } = req.body;

  const system = await System.findById(systemId).populate({
    path: "users",
    select: "-password -systems -notifications",
  });

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const user = await User.findOne({ email });

  if (!user) {
    return res.status(400).json({ message: "Wrong email" });
  }

  const userIndex = system.users.findIndex((oneUser) =>
    oneUser._id.equals(user._id)
  );

  if (userIndex === -1) {
    return res.status(400).json({ message: "This user is not in this system" });
  }

  const updatedSystem = system.users.filter(
    (oneUser) => !oneUser._id.equals(user._id)
  );
  const updatedUser = user.systems.filter(
    (oneSystem) => !oneSystem.equals(systemId)
  );

  system.users = updatedSystem;
  user.systems = updatedUser;

  await system.save();
  await user.save();

  const updatedUsers = await User.find({ systems: systemId })
    .select("-password -systems -notifications")
    .lean();
  const userIds = updatedUsers.map((oneUser) => oneUser._id);

  const usersWithHostIndicator = system.users.map((oneUser) => {
    return {
      _id: oneUser._id,
      userName: oneUser.userName,
      email: oneUser.email,
      isHosts: userIds.includes(oneUser._id),
    };
  });

  res.json(usersWithHostIndicator);
};

exports.setHost = async (req, res) => {
  const { systemId, email } = req.body;

  const system = await System.findById(systemId).populate({
    path: "users",
    select: "-password -systems -notifications",
  });

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const user = await User.findOne({ email });

  if (!user) {
    return res.status(400).json({ message: "Wrong email" });
  }

  const userIndex = system.users.findIndex(
    (u) => u._id.toString() === user._id.toString()
  );

  if (userIndex === -1) {
    return res.status(400).json({ message: "This user is not in this system" });
  }

  system.hosts.push(user._id);
  await system.save();

  const updatedSystem = await System.findById(systemId).populate({
    path: "users",
    select: "-password -systems -notifications",
  });

  const updatedUsers = updatedSystem.users.map((u) => {
    return {
      _id: u._id,
      userName: u.userName,
      email: u.email,
      isHosts: system.hosts.includes(u._id),
    };
  });

  res.json(updatedUsers);
};
