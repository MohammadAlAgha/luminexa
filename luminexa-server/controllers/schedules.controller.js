const System = require("../models/system.model");

exports.addSchedule = async (req, res) => {
  const { systemId, scheduleTitle, time, repeat } = req.body;

  const schedule = {
    scheduleTitle,
    time,
    repeat,
  };
  //creating the new schedule form

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  system.schedules.push(schedule); //adding the new schedule to the system

  await system.save();

  res.json(system);
};

exports.getSchedules = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  res.json(system.schedules);
};

exports.toggleSchedule = async (req, res) => {
  const { systemId, scheduleId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const schedule = system.schedules.find(
    (schedule) => schedule._id == scheduleId
  ); //finding the schedule in that system by ID

  if (!schedule) {
    return res.status(404).json({ message: "Schedule not found" });
  } //checking if the schedule exists

  schedule.scheduleStatus = schedule.scheduleStatus == "on" ? "off" : "on"; //toggling the schedule from on to off or from off to on

  await system.save();

  res.json(system);
};

exports.updateSchedule = async (req, res) => {
  const { systemId, scheduleId, scheduleTitle, time, repeat } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const schedule = system.schedules.find(
    (schedule) => schedule._id == scheduleId
  ); //finding the schedule in that system by ID

  if (!schedule) {
    return res.status(404).json({ message: "Schedule not found" });
  } //checking if schedule exists

  schedule.scheduleTitle = scheduleTitle;
  schedule.time = time;
  schedule.repeat = repeat;
  //updating the schedule with the new values

  await system.save();

  res.json(system);
};
