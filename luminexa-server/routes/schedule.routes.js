const { Router } = require("express");
const router = Router();

const {
  addSchedule,
  getSchedules,
} = require("../controllers/schedules.controller");

router.post("/addSchedule", addSchedule);
router.post("/getSchedules", getSchedules);

module.exports = router;
