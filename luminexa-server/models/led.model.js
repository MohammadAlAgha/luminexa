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
  intesnsity: {
    type: Number,
    required: true,
  },
  color: {
    type: String,
    enum: ["standard", "red", "blue", "green", "yellow", "purple", "orange"],
    default: "standard",
  },
});

const Led = mongoose.model("Led", ledSchema);

module.exports = Led;
