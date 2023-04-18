const { Router } = require("express");
const router = Router();

const {
  getSystemUsers,
  renameSystem,
  renameLed,
  systemShutDown,
} = require("../controllers/host.controller");

router.post("/getSystemUsers", getSystemUsers);
router.post("/renameSystem", renameSystem);
router.post("/renameLed", renameLed);
router.post("/systemShutDown", systemShutDown);

module.exports = router;
