const { Router } = require("express");
const router = Router();

const {
  getModes,
  addMode,

  toggleMode,
  updateMode,
} = require("../controllers/modes.controller");

router.post("/getModes", getModes);
router.post("/addMode", addMode);
router.put("/toggleMode", toggleMode);
router.put("/updateMode", updateMode);

module.exports = router;
