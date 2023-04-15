const { Router } = require("express");
const router = Router();

const { getModes, setModeStatus } = require("../controllers/modes.controller");

router.post("getModes", getModes);
router.post("setModeStatus", setModeStatus);

module.exports = router;
