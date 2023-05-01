const mongoose = require("mongoose");
const historySchema = require("./history.model");

const ledSchema = new mongoose.Schema({
  ledName: {
    type: String,
    required: true,
    unique: true,
  },

  history: [historySchema],
});

const Led = mongoose.model("Led", ledSchema);

module.exports = Led;
