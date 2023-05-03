import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/customeCheckBox.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class SetSchedulePage extends StatefulWidget {
  const SetSchedulePage({super.key});
  @override
  State<SetSchedulePage> createState() => _SetSchedulePageState();
}

class _SetSchedulePageState extends State<SetSchedulePage> {
  final scheduleName = TextEditingController();
  TimeOfDay time = TimeOfDay(hour: 12, minute: 0);

  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  final leds = ["LED 1", "LED 2", "LED 3", "LED 4"];
  final status = ["ON", "OFF", "OFF", "ON"];
  @override
  Widget build(BuildContext context) {
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
              time.format(context),
              style: TextStyle(
                  fontFamily: "ralewayBold", fontSize: 25, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: styledButton(
                innerText: "Pick a time",
                onTap: showTime,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            titleWidget(title: "Repeat"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
              itemCount: leds.length,
              itemBuilder: (BuildContext context, int index) {
                return ledListOption(
                    ledName: leds[index], status: status[index]);
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
  }
}
