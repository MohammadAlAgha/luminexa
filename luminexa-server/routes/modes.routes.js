const { Router } = require("express");
const router = Router();

const {
  getModes,
  addMode,
  applyMode,
} = require("../controllers/modes.controller");

router.post("/getModes", getModes);
router.post("/addMode", addMode);
router.post("/applyMode", applyMode);

module.exports = router;
