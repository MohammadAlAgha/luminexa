const mongoose = require("mongoose");
const ledSchema = require("./led.model");
const modesSchema = require("./mode.model");
const ledConfigSchema = require("./ledConfiguration.model");

const scheduleSchema = new mongoose.Schema({
  scheduleTitle: {
    type: String,
    required: true,
  },
  timeStart: {
    type: Date,
    required: true,
  },
  timeEnd: {
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

  leds: [ledConfigSchema],
});

const systemSchema = new mongoose.Schema({
  hosts: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  ],
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
  lastManual: [ledConfigSchema],
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
