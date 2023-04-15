const Led = require("../models/led.model");
const System = require("../models/system.model");

exports.getLeds = async (req, res) => {
  const { systemId } = res.body;
  const system = await System.findById(systemId);

  res.json(system.leds);
};
