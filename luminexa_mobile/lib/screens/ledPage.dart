import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class LedsPage extends StatefulWidget {
  const LedsPage({super.key});

  @override
  State<LedsPage> createState() => _LedsPageState();
}

class _LedsPageState extends State<LedsPage> {
  final leds = [
    "LED 1",
    "LED 2",
    "LED 3",
    "LED 4",
    "LED 4",
    "LED 4",
    "LED 4",
    "LED 4",
    "LED 4",
    "LED 4",
  ];
  final status = ["ON", "OFF", "OFF", "ON", "ON", "ON", "ON", "ON", "ON", "ON"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            titleWidget(title: "Edite LEDs in Kitchen"),
            ListView.builder(
              physics: ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemCount: leds.length,
              itemBuilder: (BuildContext context, int index) {
                return ledListOption(
                    ledName: leds[index], status: status[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
