const { Router } = require("express");
const router = Router();

const { addSystem } = require("../controllers/systems.controller");

route.post("/addSystem", addSystem);

module.exports = router;
