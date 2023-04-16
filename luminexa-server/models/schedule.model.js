const mongoose = require("mongoose");

const scheduleSchema = new mongoose.Schema({
  scheduleTitle: {
    type: String,
    required: true,
  },
  time: {
    type: Date,
    required: true,
  },
  repeat: {
    type: [
      {
        type: String,
        enum: [
          "monday",
          "tuesday",
          "wednesday",
          "thursday",
          "friday",
          "saturday",
          "sunday",
        ],
      },
    ],
    default: [],
  },
  scheduleStatus: {
    type: String,
    enum: ["on", "off"],
    default: "on",
  },
});
