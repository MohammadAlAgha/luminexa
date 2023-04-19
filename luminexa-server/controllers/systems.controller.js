const System = require("../models/system.model");
const User = require("../models/user.model");

exports.addSystem = async (req, res) => {
  const { serialNumber } = req.body;

  const system = await System.findOne({ serialNumber: serialNumber }); //Finding the system by serial number

  if (!system) {
    return res.status(404).json({ message: "System not found" }); //checking if system exists
  }

  const user = await User.findById(req.user.id); //Getting the authenticated user

  if (!user) {
    return res.status(404).json({ message: "User not found" });
  } //checking if the user exists

  if (user.systems.includes(system._id)) {
    return res
      .status(400)
      .json({ message: "You are already connected to that system" });
  } //Checking if the user is connecting to an already connected system

  const updatedUser = await User.findByIdAndUpdate(
    req.user.id,
    { $addToSet: { systems: system._id } },
    { new: true }
  ); //Adding the system to collection of systems the user has

  if (system.hosts.length === 0) {
    await System.updateOne(
      { _id: system._id },
      { $addToSet: { users: updatedUser._id, hosts: updatedUser._id } }
    ); //setting the user as a host if this user is the first user in this system and adding this user to the set of users in this system
  } else {
    await System.updateOne(
      { _id: system._id },
      { $addToSet: { users: updatedUser._id } }
    ); //Adding this user as a normal user if a host exist
  }

  await system.save();

  res.json(updatedUser);
};

exports.getSystems = async (req, res) => {
  const user = await User.findById(req.user.id); //Finding the authenticated user then getting all the systems he is connected to

  res.json(user.systems);
};
