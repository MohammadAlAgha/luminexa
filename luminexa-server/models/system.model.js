const mongoose = require("mongoose");
const modesSchema = require("../models/mode.model");

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
  intensity: {
    type: Number,
    required: true,
  },
  color: {
    type: String,
    enum: ["standard", "red", "blue", "green", "yellow", "purple", "orange"],
    default: "standard",
  },
  history: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "History",
      default: [],
    },
  ],
});

module.exports = ledSchema;

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

const systemSchema = new mongoose.Schema({
  systemName: {
    type: String,
    required: true,
  },
  serialNumber: {
    type: String,
    unique: true,
    required: true,
  },
  leds: [ledSchema],
  lastManual: [ledSchema],
  modes: [modesSchema],
  schedules: [scheduleSchema],
  users: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  ],
});

const System = mongoose.model("System", systemSchema);

module.exports = System;
