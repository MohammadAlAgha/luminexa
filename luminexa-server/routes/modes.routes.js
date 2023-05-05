const { Router } = require("express");
const router = Router();

const {
  getModes,
  addMode,
  deleteMode,
  toggleMode,
  updateMode,
} = require("../controllers/modes.controller");

router.get("/getModes", getModes);
router.post("/addMode", addMode);
router.delete("/deleteMode", deleteMode);
router.put("/toggleMode", toggleMode);
router.put("/updateMode", updateMode);

module.exports = router;
