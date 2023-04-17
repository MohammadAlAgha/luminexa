const mongoose = require("mongoose");
const ledSchema = require("../models/led.model");

const modesSchema = new mongoose.Schema({
  modeName: {
    type: String,
    required: true,
  },
  modeStatus: {
    type: String,
    enum: ["on", "off"],
    default: "off",
  },
  leds: [ledSchema],
});

module.exports = modesSchema;
