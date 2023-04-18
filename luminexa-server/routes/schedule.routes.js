const { Router } = require("express");
const router = Router();

const {
  addSchedule,
  getSchedules,
  toggleSchedule,
  updateSchedule,
} = require("../controllers/schedules.controller");

router.post("/addSchedule", addSchedule);
router.post("/getSchedules", getSchedules);
router.put("/toggleSchedule", toggleSchedule);
router.put("/updateSchedule", updateSchedule);

module.exports = router;
