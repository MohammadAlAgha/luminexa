const { Router } = require("express");
const router = Router();

const { addSystem } = require("../controllers/systems.controller");

router.post("/addSystem", addSystem);

module.exports = router;
