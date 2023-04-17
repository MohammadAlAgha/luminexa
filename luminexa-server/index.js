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
const modeRouter = require("./routes/modes.routes");
app.use("/modes", authMiddleware, modeRouter);
const notificationRouter = require("./routes/notifications.routes");
app.use("/notifications", authMiddleware, notificationRouter);
const hostRouter = require("./routes/host.routes");
const { hostMiddleware } = require("./middlewares/host.middleware");
app.use("/host", authMiddleware, hostMiddleware, hostRouter);

app.listen(process.env.PORT, (error) => {
  if (error) console.error(error);
  console.log(`Server Running on Port ${process.env.PORT}`);
  require("./configs/db.configs");
});
