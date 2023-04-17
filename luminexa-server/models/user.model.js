const mongoose = require("mongoose");
const notificationsSchema = require("../models/notification.model");

const userSchema = new mongoose.Schema({
  userName: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    unique: true,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  userType: {
    type: String,
    enum: ["host", "user"],
    default: "user",
  },
  deviceToken: {
    type: String,
  },
  systems: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "System",
    },
  ],
  notifications: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Notifications",
    },
  ],
});

const User = mongoose.model("User", userSchema);

module.exports = User;
