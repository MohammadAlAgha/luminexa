const { Router } = require("express");
const router = Router();

const { createInstance } = require("../controllers/histroy.controller");

router.post("/instance", createInstance);

module.exports = router;
