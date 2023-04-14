const mongoose = require("mongoose");

const consumptionSchema = new mongoose.Schema({
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

const Consumption = mongoose.model("Consumption", consumptionSchema);

module.exports = Consumption;
