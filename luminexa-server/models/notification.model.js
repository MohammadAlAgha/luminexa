const mongoose = require("mongoose");

const notificationSchema = new mongoose.Schema({
  time: {
    type: Date,
    required: true,
  },
  system: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "System",
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
});

const Notification = mongoose.model("Notification", notificationSchema);

module.exports = Notification;
