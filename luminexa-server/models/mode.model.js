const mongoose = require("mongoose");

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
  leds: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Led",
      required: true,
    },
  ],
});

const Mode = mongoose.model("Mode", modeSchema);

module.exports = Mode;
