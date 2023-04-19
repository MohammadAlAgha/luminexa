const { Router } = require("express");
const router = Router();

const {
  getSystemUsers,
  renameSystem,
  renameLed,
  systemShutDown,
} = require("../controllers/host.controller");

router.post("/getSystemUsers", getSystemUsers);
router.put("/renameSystem", renameSystem);
router.put("/renameLed", renameLed);
router.post("/systemShutDown", systemShutDown);

module.exports = router;
