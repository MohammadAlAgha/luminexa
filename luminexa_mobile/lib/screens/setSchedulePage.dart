import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
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
  TimeOfDay timeToStart = TimeOfDay(hour: 12, minute: 0);
  TimeOfDay timeToEnd = TimeOfDay(hour: 1, minute: 0);

  void showTimeStart() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        timeToStart = value!;
      });
    });
  }

  void showTimeEnd() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        timeToEnd = value!;
      });
    });
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
                sytledTextField(
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
                  timeToStart.format(context),
                  style: TextStyle(
                      fontFamily: "ralewayBold",
                      fontSize: 25,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: styledButton(
                    innerText: "Pick a time to start",
                    onTap: showTimeStart,
                  ),
                ),
                Text(
                  timeToEnd.format(context),
                  style: TextStyle(
                      fontFamily: "ralewayBold",
                      fontSize: 25,
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: styledButton(
                    innerText: "Pick a time to end",
                    onTap: showTimeEnd,
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
                    children: [
                      customeCheckBox(day: "Mon", isPressed: false),
                      customeCheckBox(day: "Tue", isPressed: false),
                      customeCheckBox(day: "Wed", isPressed: false),
                      customeCheckBox(day: "Thu", isPressed: false),
                      customeCheckBox(day: "Fri", isPressed: false),
                      customeCheckBox(day: "Sat", isPressed: false),
                      customeCheckBox(day: "Sun", isPressed: false),
                    ],
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
                        led: _leds[index],
                        ledName: _leds[index].ledName,
                        status: _leds[index].ledStatus);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: styledButton(
                    innerText: "Set Schedule",
                    onTap: () {},
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
