const User = require("../models/user.model");
const Notification = require("../models/notification.model");
const System = require("../models/system.model");

exports.createNotifications = async (req, res) => {
  const { time, systemId, description } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const notification = await Notification.create({
    time: time,
    system: system._id,
    description: description,
  }); //creating the notification from

  const user = await User.findByIdAndUpdate(
    req.user.id,
    { $addToSet: { notifications: notification.id } },
    { new: true }
  ); //adding the notification ID in the authenticated user notifications

  await user.save();

  res.json(user.notifications);
};

exports.getNotifications = async (req, res) => {
  const user = await User.findById(req.user.id); //finding the authenticated user
  res.json(user.systems);
};

exports.getSystemNotifications = async (req, res) => {
  const { systemId } = req.body;

  const notifications = await Notification.find({ system: systemId }); //finding the notifications with the system ID

  res.json(notifications);
};
