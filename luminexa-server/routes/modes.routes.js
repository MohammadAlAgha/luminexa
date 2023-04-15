const { Router } = require("express");
const router = Router();

const { getModes } = require("../controllers/modes.controller");

router.post("getModes", getModes);

module.exports = router;
