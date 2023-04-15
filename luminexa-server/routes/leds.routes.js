const { Router } = require("express");
const router = Router();

const { getLeds } = require("../controllers/leds.controller");

router.post("/getLeds", getLeds);

module.exports = router;
