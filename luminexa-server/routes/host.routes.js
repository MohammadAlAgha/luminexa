const { Router } = require("express");
const router = Router();

const {
  getSystemUsers,
  renameSystem,
} = require("../controllers/host.controller");

router.post("/getSystemUsers", getSystemUsers);
router.post("/renameSystem", renameSystem);

module.exports = router;
