const { Router } = require("express");
const router = Router();

const { getModes, addMode } = require("../controllers/modes.controller");

router.post("/getModes", getModes);
router.post("/addMode", addMode);

module.exports = router;
