const mongoose = require("mongoose");

const ledConfigSchema = new mongoose.Schema({
  led: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Led",
  },
  ledStatus: {
    type: String,
    enum: ["on", "off"],
    required: true,
  },
  intensity: {
    type: Number,
    required: true,
  },
  color: {
    type: String,
    enum: ["standard", "red", "blue", "green", "yellow", "purple", "orange"],
    default: "standard",
  },
});

module.exports = ledConfigSchema;
