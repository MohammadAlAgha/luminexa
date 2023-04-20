const { Router } = require("express");
const router = Router();

const {
  getSystemUsers,
  renameSystem,
  renameLed,
  systemShutDown,
  addUser,
  deleteUser,
  setHost,
} = require("../controllers/host.controller");

router.post("/getSystemUsers", getSystemUsers);
router.put("/renameSystem", renameSystem);
router.put("/renameLed", renameLed);
router.post("/systemShutDown", systemShutDown);
router.post("/addUser", addUser);
router.post("/deleteUser", deleteUser);
router.put("/setHost", setHost);

module.exports = router;
