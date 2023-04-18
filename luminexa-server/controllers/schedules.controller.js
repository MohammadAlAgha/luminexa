const System = require("../models/system.model");

exports.addSchedule = async (req, res) => {
  const { systemId, scheduleTitle, time, repeat } = req.body;

  const schedule = {
    scheduleTitle,
    time,
    repeat,
  };

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  system.schedules.push(schedule);

  await system.save();

  res.json(system);
};

exports.getSchedules = async (req, res) => {
  const { systemId } = req.body;
  const system = await System.findById(systemId);

  res.json(system.schedules);
};

exports.toggleSchedule = async (req, res) => {
  const { systemId, scheduleId } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const schedule = system.schedules.find(
    (schedule) => schedule._id == scheduleId
  );

  if (!schedule) {
    return res.status(404).json({ message: "Schedule not found" });
  }

  schedule.scheduleStatus = schedule.scheduleStatus == "on" ? "off" : "on";

  await system.save();

  res.json(system);
};

exports.updateSchedule = async (req, res) => {
  const { systemId, scheduleId, scheduleTitle, time, repeat } = req.body;

  const system = await System.findById(systemId);

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  }

  const scheduleIndex = system.schedules.findIndex(
    (schedule) => schedule._id == scheduleId
  );

  if (scheduleIndex === -1) {
    return res.status(404).json({ message: "Schedule not found" });
  }

  system.schedules[scheduleIndex] = {
    _id: scheduleId,
    scheduleTitle,
    time,
    repeat,
  };

  await system.save();

  res.json(system);
};
