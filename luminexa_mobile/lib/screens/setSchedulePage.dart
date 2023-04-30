import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/customeCheckBox.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "Title of the schedule",
                      style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              sytledTextField(
                isPass: false,
                controller: scheduleName,
                label: "Title",
                hintText: "Title",
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "Time",
                      style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                time.format(context),
                style: TextStyle(fontFamily: "ralewayBold", fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: styledButton(
                  innerText: "Pick a time",
                  onTap: showTime,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "Repeat",
                      style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
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
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "LEDs in Kitchen",
                      style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
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
      ),
    );
  }
}
