const { Router } = require("express");
const router = Router();

const {
  addSchedule,
  getSchedules,
  setScheduleStatus,
} = require("../controllers/schedules.controller");

router.post("/addSchedule", addSchedule);
router.post("/getSchedules", getSchedules);
router.post("/setScheduleStatus", setScheduleStatus);

module.exports = router;
