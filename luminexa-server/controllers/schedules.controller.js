const Schedule = require("../models/schedule.model");
const System = require("../models/system.model");

exports.addSchedule = async (req, res) => {
  const { systemId, scheduleTitle, time, repeat } = req.body;

  const schedule = await Schedule.create({
    scheduleTitle,
    time,
    repeat,
  });

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  system.schedules.push(schedule.id);

  await system.save();

  res.json(system);
};
