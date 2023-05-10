const User = require("../models/user.model");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

exports.register = async (req, res) => {
  const { email, password, userName, confirmPassword } = req.body;
  const { validateEmail, validatePassword } = require("./regex"); //importing the validation functions

  // Validating the email using regex
  if (!validateEmail) {
    return res.status(400).json({ message: "Invalid email format" });
  }

  //Validating the password using regex
  if (!validatePassword) {
    return res.status(400).json({
      message:
        "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number",
    });
  }

  if (password !== confirmPassword) {
    return res.status(400).json({ message: "Check your password again" });
  } //Ckecking if the confirm password is the same as the first password

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

  res.status(201).json({ token });
};

exports.login = async (req, res) => {
  const { email, password } = req.body;

  const user = await User.findOne({ email }).populate("systems"); //finding user by email

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

  const isHost = [];

  user.systems.forEach((system) => {
    if (system.hosts.includes(user.id)) {
      isHost.push(true);
    } else isHost.push(false);
  });

  res.json({ token, isHost });
};
