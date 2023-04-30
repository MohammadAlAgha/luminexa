import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luminexa_mobile/screens/LedPage.dart';
import 'package:luminexa_mobile/screens/ModePage.dart';
import 'package:luminexa_mobile/screens/NotificationPage.dart';
import 'package:luminexa_mobile/screens/SchedulePage.dart';
import 'package:luminexa_mobile/screens/SettingsPage.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';

class SystemPage extends StatefulWidget {
  const SystemPage({super.key});

  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  @override
  int currentIndex = 0;
  void navigateTab(index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List pages = [
    LedsPage(),
    SchedulePage(),
    ModePage(),
    NotificationsPage()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: GNav(
              onTabChange: (value) => navigateTab(value),
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
        appBar: appBar(
          title: "Kitchen",
          iconAction: Icon(Icons.settings),
          iconLeading: Icon(Icons.arrow_back),
        ),
        body: pages[currentIndex]);
  }
}
