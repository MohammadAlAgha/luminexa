const mongoose = require("mongoose");

const systemSchema = new mongoose.Schema({
  systemName: {
    type: String,
    required: true,
  },
  serialNumber: {
    type: String,
    unique: true,
    required: true,
  },
  leds: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Led",
      required: true,
    },
  ],
  modes: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Mode",
    },
  ],
  schedules: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Schedule",
    },
  ],
  users: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  ],
});

const System = mongoose.model("System", systemSchema);

module.exports = System;
