const System = require("../models/system.model");

exports.getSchedules = async (req, res) => {
  const { systemId } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  res.json(system.schedules);
};

exports.addSchedule = async (req, res) => {
  const { systemId, scheduleTitle, time, repeat } = req.body;

  const system = await System.findById(systemId); //getting the system by ID

  if (!system) {
    return res.status(404).json({ message: "System not found" });
  } //checking if system exists

  const leds = system.leds; //getting the system current leds status
  const originalConfigs = system.lastManual; //getting the system current leds status

  const configurations = [];

  leds.forEach((led) => {
    configurations.push(led.ledConfig);
  }); //Saving the actual led status

  const schedule = {
    scheduleTitle,
    time,
    repeat,
    leds: configurations,
  };
  //creating the new schedule form with the current led status

  system.schedules.push(schedule); //adding the new schedule to the system

  leds.forEach((led) => {
    originalConfigs.forEach((config) => {
      if (led.id == config.leds) {
        led.ledConfig = config;
      }
    });
  });
  //retrieved the old status of the leds

  await system.save();

  res.json(system);
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

  const leds = system.leds; //getting the system current leds status
  const originalConfigs = system.lastManual; //getting the system current leds status

  const configurations = [];

  leds.forEach((led) => {
    configurations.push(led.ledConfig);
  }); //Saving the actual led status

  schedule.scheduleTitle = scheduleTitle;
  schedule.time = time;
  schedule.repeat = repeat;
  schedule.leds = configurations;
  //updating the schedule with the new values

  leds.forEach((led) => {
    originalConfigs.forEach((config) => {
      if (led.id == config.leds) {
        led.ledConfig = config;
      }
    });
  });
  //retrieved the old status of the leds
  await system.save();

  res.json(system);
};
