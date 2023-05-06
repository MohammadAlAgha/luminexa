const { Router } = require("express");
const router = Router();

const {
  createNotifications,
  getNotifications,
  getSystemNotifications,
} = require("../controllers/notifications.controller");

router.post("/createNotifications", createNotifications);
router.get("/getNotifications", getNotifications);
router.get("/getSystemNotifications", getSystemNotifications);

module.exports = router;
