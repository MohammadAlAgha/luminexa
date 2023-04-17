const { Router } = require("express");
const router = Router();

const {
  createNotifications,
  getNotifications,
  getSystemNotitifications,
} = require("../controllers/notifications.controller");

router.post("/createNotifications", createNotifications);
router.post("/getNotifications", getNotifications);
router.post("/getSystemNotitifications", getSystemNotitifications);

module.exports = router;
