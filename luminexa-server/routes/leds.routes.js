const { Router } = require("express");
const router = Router();

const {
  getLeds,
  editLed,
  addLed,
  getActiveLeds,
  editConfigs,
} = require("../controllers/leds.controller");

router.post("/getLeds", getLeds);
router.put("/editLed", editLed);
router.put("/editConfigs", editConfigs);
router.post("/addled", addLed);
router.get("/getActiveLeds", getActiveLeds);

module.exports = router;
