const History = require("../models/history.model");

exports.createInstance = async (req, res) => {
  const { time, intensity, currentConsumption } = req.body;

  const instance = await History.create(time, intensity, currentConsumption);

  res.json(instance);
};
