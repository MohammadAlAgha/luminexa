import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luminexa_mobile/routes/routes.dart';
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
              color: Color.fromARGB(255, 63, 139, 0),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: GNav(
              activeColor: Colors.white,
              onTabChange: (value) => navigateTab(value),
              backgroundColor: Color.fromARGB(255, 63, 139, 0),
              color: Colors.white,
              gap: 10,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              tabs: [
                GButton(
                  icon: Icons.lightbulb,
                  iconSize: 20,
                  text: "LEDs",
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: "RalewayBold",
                    color: Colors.white,
                  ),
                ),
                GButton(
                  icon: Icons.schedule,
                  iconSize: 20,
                  text: "Schedules",
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: "RalewayBold",
                    color: Colors.white,
                  ),
                ),
                GButton(
                  icon: Icons.list,
                  iconSize: 20,
                  text: "Modes",
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: "RalewayBold",
                    color: Colors.white,
                  ),
                ),
                GButton(
                  icon: Icons.notifications,
                  iconSize: 20,
                  text: "Notifications",
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: "RalewayBold",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: appBar(
          title: "Kitchen",
          iconAction: Icon(Icons.settings),
          iconActionFunction: () =>
              Navigator.of(context).pushNamed(RouteManager.settingsPage),
          iconLeading: Icon(Icons.arrow_back),
          iconLeadingFunction: () => Navigator.of(context).pop(context),
        ),
        body: pages[currentIndex]);
  }
}
