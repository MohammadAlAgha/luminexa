const mongoose = require("mongoose");

const notificationSchema = new mongoose.Schema({
  time: {
    type: Date,
    required: true,
  },
  place: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "System",
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
});

module.exports = notificationSchema;
