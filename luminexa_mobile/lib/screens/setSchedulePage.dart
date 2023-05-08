import 'package:flutter/material.dart';
import 'package:luminexa_mobile/helpers/timeHelpers.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/modeModel.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/models/weekDayModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/providers/ModesProvider.dart';
import 'package:luminexa_mobile/providers/SchedulesProvider.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/customeCheckBox.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class SetSchedulePage extends StatefulWidget {
  final String systemId;
  const SetSchedulePage({
    super.key,
    required this.systemId,
  });
  @override
  State<SetSchedulePage> createState() => _SetSchedulePageState();
}

class _SetSchedulePageState extends State<SetSchedulePage> {
  final List<WeekDay> weekdays = [
    WeekDay(holder: "Mon", value: "monday"),
    WeekDay(holder: "Tue", value: "tuesday"),
    WeekDay(holder: "Wed", value: "wednesday"),
    WeekDay(holder: "Thu", value: "thursday"),
    WeekDay(holder: "Fri", value: "friday"),
    WeekDay(holder: "Sat", value: "saturday"),
    WeekDay(holder: "Sun", value: "sunday"),
  ];

  Future<void> fetchLeds() async {
    await Provider.of<LedsProvider>(context, listen: false)
        .getLeds(widget.systemId);
  }

  @override
  void initState() {
    super.initState();
    fetchLeds();
  }

  final scheduleName = TextEditingController();

  DateTime timeToStart = DateTime.now();
  DateTime timeToEnd = DateTime.now().add(Duration(hours: 1));

  List<String> days = [];

  addDay(String day) {
    if (!days.contains(day)) {
      days.add(day);
    } else {
      days.remove(day);
    }
    print(days);
  }

  void showTimePopup(String time) {
    showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: timeToStart.hour, minute: timeToStart.minute),
    ).then((value) {
      String date = getStringTimeOfDay(value);
      setState(() {
        if (time == "start")
          timeToStart = DateTime.parse(date);
        else
          timeToEnd = DateTime.parse(date);
      });
    });
  }

  List<Widget> _buildWeekDays() {
    List<Widget> tiles = [];

    weekdays.forEach((weekDay) {
      tiles.add(
        customeCheckBox(
            day: weekDay.holder, onTap: () => addDay(weekDay.value)),
      );
    });

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LedsProvider>(
      builder: (context, value, child) {
        List<Led> _leds = value.leds;
        return Scaffold(
          appBar: appBar(
            title: "Set Schedule",
            iconLeading: Icon(Icons.arrow_back),
            iconLeadingFunction: () {
              Navigator.of(context).pop(context);
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                titleWidget(title: "Title of the schedule"),
                SizedBox(
                  height: 10,
                ),
                styledTextField(
                  decoration: Theme.of(context).inputDecorationTheme,
                  isPass: false,
                  controller: scheduleName,
                  label: "Title",
                  hintText: "Title",
                ),
                SizedBox(
                  height: 30,
                ),
                titleWidget(title: "Time"),
                Text(
                  getTimeFormat(timeToStart),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: styledButton(
                    innerText: "Pick a time to start",
                    onTap: () => showTimePopup("start"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  getTimeFormat(timeToEnd),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: styledButton(
                    innerText: "Pick a time to end",
                    onTap: () => showTimePopup("end"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                titleWidget(title: "Repeat"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _buildWeekDays(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                titleWidget(title: "LEDs in Kitchen"),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: ScrollPhysics(parent: null),
                  shrinkWrap: true,
                  itemCount: _leds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ledListOption(
                        config: true,
                        system: widget.systemId,
                        led: _leds[index],
                        ledName: _leds[index].ledName,
                        status: _leds[index].ledStatus);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: styledButton(
                    innerText: "Set Schedule",
                    onTap: () {
                      Provider.of<SchedulesProvider>(context, listen: false)
                          .addSchedule(widget.systemId, scheduleName.text,
                              timeToStart, timeToEnd, days);
                      Navigator.of(context).pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
