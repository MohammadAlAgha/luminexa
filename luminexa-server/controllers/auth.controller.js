const User = require("../models/user.model");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

exports.register = async (req, res) => {
  const { email, password, userName } = req.body;

  // Validating the email using regex
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ message: "Invalid email format" });
  }

  //Validating the password using regex
  const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
  if (!passwordRegex.test(password)) {
    return res.status(400).json({
      message:
        "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number",
    });
  }

  const existingUser = await User.findOne({ email });

  if (existingUser) {
    return res.status(409).json({ message: "Email already exists" });
  } //checking of the email address exists

  const saltRounds = 10;
  const salt = await bcrypt.genSalt(saltRounds);
  const hashed = await bcrypt.hash(password, salt); //Hashing the password before saving

  const user = new User();
  user.email = email;
  user.password = hashed;
  user.userName = userName;
  //creating the new user

  await user.save();

  const token = jwt.sign(
    { id: user._id, email: user.email },
    process.env.SECRET_KEY
  ); //generating a token

  const { password: hashedPassword, ...newUser } = user.toJSON();

  res.status(201).json({ newUser, token });
};

exports.login = async (req, res) => {
  const { email, password } = req.body;

  const user = await User.findOne({ email }); //finding user by email

  if (!user) {
    return res.status(404).json({ message: "Invalid Credentials" });
  } //checking if the user exists after checking searching for his email

  const isMatched = await bcrypt.compare(password, user.password);
  if (!isMatched)
    return res.status(404).json({ message: "Invalid Credentials" }); //comparing the entered password with the registered hashed password peviously entered by the user

  const token = jwt.sign(
    { id: user._id, email: user.email },
    process.env.SECRET_KEY
  ); //generating a token

  res.json({ token });
};
