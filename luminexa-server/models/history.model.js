const mongoose = require("mongoose");

const historySchema = new mongoose.Schema({
  time: {
    type: Date,
    required: true,
  },
  intensity: {
    type: Number,
    required: true,
  },
  currentConsumption: {
    type: Number,
    required: true,
  },
});

const History = mongoose.model("History", historySchema);

module.exports = History;
