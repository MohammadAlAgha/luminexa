const { Router } = require("express");
const router = Router();

const {
  getLeds,
  editLed,
  addLed,
  getActiveLeds,
} = require("../controllers/leds.controller");

router.post("/getLeds", getLeds);
router.put("/editLed", editLed);
router.post("/addled", addLed);
router.get("/getActiveLeds", getActiveLeds);

module.exports = router;
