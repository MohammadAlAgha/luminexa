const mongoose = require("mongoose");
const ledsSchema = require("../models/led.model");

const modeSchema = new mongoose.Schema({
  modeName: {
    type: String,
    required: true,
  },
  modeStatus: {
    type: String,
    enum: ["on", "off"],
    default: "off",
  },
  leds: [ledsSchema],
});
