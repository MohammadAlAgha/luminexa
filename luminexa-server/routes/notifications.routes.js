const { Router } = require("express");
const router = Router();

const {
  createNotifications,
} = require("../controllers/notifications.controller");

router.post("/createNotifications", createNotifications);

module.exports = router;
