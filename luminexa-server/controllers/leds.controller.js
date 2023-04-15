const Led = require("../models/led.model");
const System = require("../models/system.model");

exports.getLeds = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.leds);
};
