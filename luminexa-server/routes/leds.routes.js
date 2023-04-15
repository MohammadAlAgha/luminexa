const { Router } = require("express");
const router = Router();

const {
  getLeds,
  editLedStatus,
  editLedIntensity,
  editLedColor,
  editLedName,
} = require("../controllers/leds.controller");

router.post("/getLeds", getLeds);
router.post("/editLedStatus", editLedStatus);
router.post("/editLedIntensity", editLedIntensity);
router.post("/editLedColor", editLedColor);
router.post("/editLedName", editLedName);

module.exports = router;
