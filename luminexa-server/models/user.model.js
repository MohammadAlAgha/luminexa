const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  userName: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    unique: true,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  userType: {
    type: String,
    enum: ["host", "user"],
    default: "user",
  },
  deviceToken: {
    type: String,
  },
  systems: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "System",
  },
});

const User = mongoose.model("User", userSchema);

module.exports = User;
