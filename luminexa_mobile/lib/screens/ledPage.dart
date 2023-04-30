import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';

class LedsPage extends StatefulWidget {
  const LedsPage({super.key});

  @override
  State<LedsPage> createState() => _LedsPageState();
}

class _LedsPageState extends State<LedsPage> {
  final leds = ["LED 1", "LED 2", "LED 3", "LED 4"];
  final status = ["ON", "OFF", "OFF", "ON"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Row(
              children: [
                Text(
                  "Edit LEDs in Kitchen",
                  style: TextStyle(
                      fontFamily: "RalewayBold",
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: leds.length,
            itemBuilder: (BuildContext context, int index) {
              return ledListOption(ledName: leds[index], status: status[index]);
            },
          )
        ],
      ),
    );
  }
}
