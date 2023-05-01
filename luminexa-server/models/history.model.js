const mongoose = require("mongoose");

const historySchema = new mongoose.Schema({
  time: {
    type: Date,
    required: true,
  },

  currentConsumption: {
    type: Number,
    required: true,
  },
});

module.exports = historySchema;
