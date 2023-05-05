const System = require("../models/system.model");

cron.schedule("* * * * *", async () => {
  console.log("Cron checking date");

  const now = new Date();
  const systems = await System.find();

  systems.forEach((system) => {
    system.schedules.forEach((schedule) => {
      console.log("now time:");
      console.log(now.getUTCHours());
      console.log("schedule time:");
      console.log(schedule.time.getUTCHours());

      const bool = checkCurrentDate(schedule.time);

      if (bool) {
        if (schedule.repeat.length > 0) {
          const bool = checkRepeat(schedule.repeat);

          if (bool) {
            console.log("System " + system.name + " is running");
          }
        } else {
          console.log("System " + system.name + " is running");
        }
      }
    });
  });
});

const checkCurrentDate = (date) => {
  const now = new Date();

  const utcDateHours = date.getUTCHours();
  const utcDateMinutes = date.getUTCMinutes();

  const utcNowHours = now.toTimeString().split(" ")[0].split(":")[0];
  const utcNowMinutes = now.getUTCMinutes();

  console.log("====================");
  console.log("|| dateHours: " + utcDateHours + "   ||");
  console.log("|| dateMinutes: " + utcDateMinutes + " ||");
  console.log("|| nowHours: " + utcNowHours + "    ||");
  console.log("|| nowMinutes: " + utcNowMinutes + "  ||");
  console.log("====================");

  console.log(utcDateHours == utcNowHours && utcDateMinutes == utcNowMinutes);

  return utcDateHours == utcNowHours && utcDateMinutes == utcNowMinutes;
};

const checkRepeat = (repeat) => {
  const now = new Date();
  const day = now.getDay();

  switch (day) {
    case 1:
      return repeat.includes("monday");
    case 2:
      return repeat.includes("tuesday");
    case 3:
      return repeat.includes("wednesday");
    case 4:
      return repeat.includes("thursday");
    case 5:
      return repeat.includes("friday");
    case 6:
      return repeat.includes("saturday");
    case 0:
      return repeat.includes("sunday");
    default:
      return false;
  }
};
