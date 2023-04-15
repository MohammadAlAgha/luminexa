const { Router } = require("express");
const router = Router();

const {
  getLeds,
  editLedStatus,
  editLedIntensity,
} = require("../controllers/leds.controller");

router.post("/getLeds", getLeds);
router.post("/editLedStatus", editLedStatus);
router.post("/editLedIntensity", editLedIntensity);

module.exports = router;
