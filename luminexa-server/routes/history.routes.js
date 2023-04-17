const { Router } = require("express");
const router = Router();

const { createInstance } = require("../controllers/Histroy.controller");

router.post("/instance", createInstance);
