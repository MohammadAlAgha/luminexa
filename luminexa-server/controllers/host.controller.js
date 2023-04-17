const System = require("../models/system.model");

exports.getSystemUsers = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId).populate({
    path: "users",
    select: "-password",
  });

  res.json(system.users);
};
