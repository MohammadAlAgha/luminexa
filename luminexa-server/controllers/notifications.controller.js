const User = require("../models/user.model");
const Notification = require("../models/notification.model");
const System = require("../models/system.model");

exports.createNotifications = async (req, res) => {
  const { time, systemId, description } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const notification = await Notification.create({
    time: time,
    system: system._id,
    description: description,
  });

  const user = await User.findByIdAndUpdate(
    req.user.id,
    { $addToSet: { notifications: notification.id } },
    { new: true }
  );

  await user.save();

  res.json(user.notifications);
};

exports.getNotifications = async (req, res) => {
  const user = await User.findById(req.user.id);
  res.json(user.systems);
};
