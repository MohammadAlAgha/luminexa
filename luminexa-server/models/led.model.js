const mongoose = require("mongoose");

const ledSchema = new mongoose.Schema({
  ledName: {
    type: String,
    required: true,
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
  history: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "History",
      default: [],
    },
  ],
});

module.exports = ledSchema;
