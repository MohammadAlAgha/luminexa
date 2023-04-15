const { Router } = require("express");
const router = Router();

const { addSchedule } = require("../controllers/schedules.controller");
const { route } = require("./auth.routes");

router.post("/addSchedule", addSchedule);

module.exports = router;
