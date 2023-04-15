const mongoose = require("mongoose");

const systemSchema = new mongoose.Schema({
  systemName: {
    type: String,
    required: true,
  },
  serialNumber: {
    type: String,
    required: true,
  },
  leds: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Led",
      required: true,
    },
  ],
  mode: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Mode",
    },
  ],
  schedule: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Schedule",
    },
  ],
  user: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  ],
});

const System = mongoose.model("System", systemSchema);

module.exports = System;
