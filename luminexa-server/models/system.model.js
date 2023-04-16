const mongoose = require("mongoose");
const ledsSchema = require("../models/led.model");
const modesSchema = require("../models/mode.model");
const schedulesSchema = require("../models/schedule.model");

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
  leds: [ledsSchema],
  modes: [modesSchema],
  schedules: [schedulesSchema],
  users: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  ],
});

const System = mongoose.model("System", systemSchema);

module.exports = System;
