const mongoose = require("mongoose");

const systemSchema = new mongoose.Schema({
  systemName: {
    type: String,
    required: true,
  },
});

const System = mongoose.model("System", systemSchema);

module.exports = System;
