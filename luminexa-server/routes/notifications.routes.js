const { Router } = require("express");
const router = Router();

const {
  createNotifications,
  getNotifications,
  getSystemNotitifications,
} = require("../controllers/notifications.controller");

router.post("/createNotifications", createNotifications);
router.get("/getNotifications", getNotifications);
router.get("/getSystemNotitifications", getSystemNotitifications);

module.exports = router;
