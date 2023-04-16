const mongoose = require("mongoose");
const ledsSchema = require("../models/system.model");

modesSchema = new mongoose.Schema({
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

module.exports = modesSchema;
