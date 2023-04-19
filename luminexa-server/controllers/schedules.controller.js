const System = require("../models/system.model");

exports.addSchedule = async (req, res) => {
  const { systemId, scheduleTitle, time, repeat } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const leds = system.leds; //getting the cuurent leds status

  const schedule = {
    scheduleTitle,
    time,
    repeat,
    leds,
  };
  //creating the new schedule form with the current led status

  system.schedules.push(schedule); //adding the new schedule to the system

  system.leds = system.lastManual; //seting back the leds as the last manual (before setting the schedule)

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

  if (schedule.scheduleStatus == "off") {
    system.leds = system.lastManual;
  } //Set the modes back to the old status after the schedule is off

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

  const leds = system.leds; //getting the cuurent leds status

  schedule.scheduleTitle = scheduleTitle;
  schedule.time = time;
  schedule.repeat = repeat;
  schedule.leds = leds;
  //updating the schedule with the new values

  system.leds = system.lastManual; //seting back the leds as the last manual (before updating the schedule)

  await system.save();

  res.json(system);
};
