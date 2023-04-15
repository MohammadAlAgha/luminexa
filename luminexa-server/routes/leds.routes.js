const { Router } = require("express");
const router = Router();

const { getLeds, editLedStatus } = require("../controllers/leds.controller");

router.post("/getLeds", getLeds);
router.post("/editLedStatus", editLedStatus);

module.exports = router;
