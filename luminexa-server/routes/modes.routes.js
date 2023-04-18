const { Router } = require("express");
const router = Router();

const {
  getModes,
  addMode,
  applyMode,
  toggleMode,
} = require("../controllers/modes.controller");

router.post("/getModes", getModes);
router.post("/addMode", addMode);
router.post("/applyMode", applyMode);
router.put("/toggleMode", toggleMode);

module.exports = router;
