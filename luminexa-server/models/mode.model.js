const mongoose = require("mongoose");
const ledSchema = require("../models/led.model");
const ledConfigSchema = require("./ledConfiguration.model");

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
  leds: [ledConfigSchema],
});

module.exports = modesSchema;
