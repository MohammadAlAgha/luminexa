const { Router } = require("express");
const router = Router();

const { addSystem, getSystems } = require("../controllers/systems.controller");

router.post("/addSystem", addSystem);
router.post("/getSystems", getSystems);

module.exports = router;
