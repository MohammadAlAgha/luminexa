import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/screens/LedPage.dart';
import 'package:luminexa_mobile/screens/ModePage.dart';
import 'package:luminexa_mobile/screens/NotificationPage.dart';
import 'package:luminexa_mobile/screens/SchedulePage.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';

class SystemPage extends StatefulWidget {
  final String systemId;
  final String systemName;

  const SystemPage({
    super.key,
    required this.systemId,
    required this.systemName,
  });

  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  int currentIndex = 0;

  void navigateTab(index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget getPage() {
    final List pages = [
      LedsPage(systemId: widget.systemId),
      SchedulePage(systemId: widget.systemId),
      ModePage(systemId: widget.systemId),
      NotificationsPage()
    ];

    return pages[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: GNav(
            activeColor: Theme.of(context).primaryColor,
            onTabChange: (value) => navigateTab(value),
            backgroundColor: Theme.of(context).primaryColor,
            tabBackgroundColor: Colors.white,
            color: Colors.white,
            gap: 10,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            tabs: [
              GButton(
                icon: Icons.lightbulb,
                iconSize: 20,
                text: "LEDs",
                textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
              GButton(
                icon: Icons.schedule,
                iconSize: 20,
                text: "Schedules",
                textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
              GButton(
                icon: Icons.list,
                iconSize: 20,
                text: "Modes",
                textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
              GButton(
                icon: Icons.notifications,
                iconSize: 20,
                text: "Notifications",
                textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
      appBar: appBar(
        title: widget.systemName,
        iconAction: Icon(Icons.settings),
        iconActionFunction: () =>
            Navigator.of(context).pushNamed(RouteManager.settingsPage),
        iconLeading: Icon(Icons.arrow_back),
        iconLeadingFunction: () => Navigator.of(context).pop(context),
      ),
      // body: pages[currentIndex],
      body: getPage(),
    );
  }
}
