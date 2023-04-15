const express = require("express");
const app = express();
require("dotenv").config();
app.use(express.json());

const authRouter = require("./routes/auth.routes");
app.use("/auth", authRouter);
const systemRouter = require("./routes/systems.routes");
const { authMiddleware } = require("./middlewares/auth.middleware");
app.use("/system", authMiddleware, systemRouter);
const ledsRouter = require("./routes/leds.routes");
app.use("/leds", authMiddleware, ledsRouter);
const scheduleRouter = require("./routes/schedule.routes");
app.use("/schedules", authMiddleware, scheduleRouter);

app.listen(process.env.PORT, (error) => {
  if (error) console.error(error);
  console.log(`Server Running on Port ${process.env.PORT}`);
  require("./configs/db.configs");
});
