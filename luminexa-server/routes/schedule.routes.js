const { Router } = require("express");
const router = Router();

const {
  addSchedule,
  getSchedules,
  setScheduleStatus,
  toggleSchedule,
} = require("../controllers/schedules.controller");

router.post("/addSchedule", addSchedule);
router.post("/getSchedules", getSchedules);
router.post("/setScheduleStatus", setScheduleStatus);
router.put("/toggleSchedule", toggleSchedule);

module.exports = router;
