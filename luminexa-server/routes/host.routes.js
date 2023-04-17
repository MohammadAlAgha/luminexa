const { Router } = require("express");
const router = Router();

const {
  getSystemUsers,
  renameSystem,
  renameLed,
} = require("../controllers/host.controller");

router.post("/getSystemUsers", getSystemUsers);
router.post("/renameSystem", renameSystem);
router.post("/renameLed", renameLed);

module.exports = router;
