const { Router } = require("express");
const router = Router();

const { getSystemUsers } = require("../controllers/host.controller");

router.post("/getSystemUsers", getSystemUsers);

module.exports = router;
