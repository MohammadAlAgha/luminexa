import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(25), right: Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: GNav(
            backgroundColor: Colors.green,
            tabBackgroundColor: Color.fromARGB(255, 255, 255, 255),
            color: Colors.white,
            gap: 10,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            tabs: [
              GButton(
                icon: Icons.lightbulb,
                iconSize: 20,
                text: "LEDs",
                textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
              ),
              GButton(
                icon: Icons.schedule,
                iconSize: 20,
                text: "Schedules",
                textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
              ),
              GButton(
                icon: Icons.list,
                iconSize: 20,
                text: "Modes",
                textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
              ),
              GButton(
                icon: Icons.notifications,
                iconSize: 20,
                text: "Notifications",
                textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
              ),
            ],
          ),
        ),
      ),
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
              },
            )
          ],
        ),
      ),
    );
  }
}
