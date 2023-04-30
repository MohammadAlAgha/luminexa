import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/listsWidget/notificationTile.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List title = [
    "Room 2 seems empty! Do want to turn off the lights?",
    "Dinner mode in the Living room is currently on.",
    "It seems cloudy out side! Do you want to increase the lights intensity?",
  ];
  final List time = ["Today, 8:11 PM", "Today, 4:25 PM", "Today, 11:37 AM"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: title.length,
                itemBuilder: (BuildContext context, int index) {
                  return notificationTile(
                      title: title[index], time: time[index]);
                })
          ],
        ),
      ),
    );
  }
}
