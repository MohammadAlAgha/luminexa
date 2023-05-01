const mongoose = require("mongoose");

const ledConfigSchema = new mongoose.Schema({
  leds: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Led",
    required: true,
  },
  ledStatus: {
    type: String,
    enum: ["on", "off"],
    required: true,
    default: "off",
  },
  intensity: {
    type: Number,
    required: true,
    default: 0,
  },
  color: {
    type: String,
    enum: ["standard", "red", "blue", "green", "yellow", "purple", "orange"],
    default: "standard",
  },
});

module.exports = ledConfigSchema;
