const { Router } = require("express");
const router = Router();

const {
  createNotifications,
  getNotifications,
} = require("../controllers/notifications.controller");

router.post("/createNotifications", createNotifications);
router.post("/getNotifications", getNotifications);

module.exports = router;
