const User = require("../models/user.model");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

exports.register = async (req, res) => {
  const { email, password, userName } = req.body;

  const existingUser = await User.findOne({ email });

  if (existingUser)
    return res.status(409).json({ message: "Email already exists" });

  const saltRounds = 10;
  const salt = await bcrypt.genSalt(saltRounds);
  const hashed = await bcrypt.hash(password, salt);

  const user = new User();
  user.email = email;
  user.password = hashed;
  user.userName = userName;

  await user.save();

  const token = jwt.sign(
    { id: user._id, email: user.email },
    process.env.SECRET_KEY
  );

  const { password: hashedPassword, ...newUser } = user.toJSON();

  res.status(201).json({ newUser, token });
};

exports.login = async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email });

  if (!user) return res.status(404).json({ message: "Invalid Credentials" });

  const isMatched = await bcrypt.compare(password, user.password);
  if (!isMatched)
    return res.status(404).json({ message: "Invalid Credentials" });

  const token = jwt.sign(
    { id: user._id, email: user.email },
    process.env.SECRET_KEY
  );

  res.json({ token });
};
