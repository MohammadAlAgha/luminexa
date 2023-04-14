const mongoose = require("mongoose");

const modeSchema = new mongoose.Schema({
  modeName: {
    type: String,
    required: true,
  },
  modeStatus: {
    type: String,
    enum: ["on", "off"],
    required: true,
  },
});

const Mode = mongoose.model("Mode", modeSchema);

module.exports = Mode;
