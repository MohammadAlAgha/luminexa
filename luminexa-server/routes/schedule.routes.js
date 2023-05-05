const { Router } = require("express");
const router = Router();

const {
  addSchedule,
  getSchedules,
  toggleSchedule,
  deleteSchedule,
  updateSchedule,
} = require("../controllers/schedules.controller");

router.post("/addSchedule", addSchedule);
router.get("/getSchedules", getSchedules);
router.put("/toggleSchedule", toggleSchedule);
router.put("/updateSchedule", updateSchedule);
router.delete("/deleteSchedule", deleteSchedule);

module.exports = router;
