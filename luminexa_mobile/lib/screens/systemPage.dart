import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';

class system extends StatefulWidget {
  const system({super.key});

  @override
  State<system> createState() => _systemState();
}

class _systemState extends State<system> {
  final leds = ["LED 1", "LED 2", "LED 3", "LED 4"];
  final status = ["ON", "OFF", "OFF", "ON"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kitchen",
          style: TextStyle(
              fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
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
                return ledListOption(
                    ledName: leds[index], status: status[index]);
              })
        ],
      )),
    );
  }
}
