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

exports.getSchedules = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.schedules);
};

exports.setScheduleStatus = async (req, res) => {
  const { scheduleId } = req.body;
  const schedule = await Schedule.findById(scheduleId);
  schedule.scheduleStatus = schedule.scheduleStatus === "on" ? "off" : "on";
  await schedule.save();
  res.json(schedule);
};
