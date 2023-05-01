const mongoose = require("mongoose");
const historySchema = require("./history.model");

const ledSchema = new mongoose.Schema({
  ledName: {
    type: String,
    required: true,
  },

  history: [historySchema],
});

module.exports = ledSchema;
