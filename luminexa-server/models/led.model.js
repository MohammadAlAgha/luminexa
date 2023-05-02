const mongoose = require("mongoose");
const historySchema = require("./history.model");
const ledConfigSchema = require("./ledConfiguration.model");

const ledSchema = new mongoose.Schema({
  ledName: {
    type: String,
    required: true,
    unique: true,
  },

  ledConfig: ledConfigSchema,

  history: [historySchema],
});

module.exports = ledSchema;
