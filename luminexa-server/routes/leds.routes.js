const { Router } = require("express");
const router = Router();

const {
  getLeds,
  editLedStatus,
  editLedIntensity,
  editLedColor,
} = require("../controllers/leds.controller");

router.post("/getLeds", getLeds);
router.post("/editLedStatus", editLedStatus);
router.post("/editLedIntensity", editLedIntensity);
router.post("/editLedColor", editLedColor);

module.exports = router;
