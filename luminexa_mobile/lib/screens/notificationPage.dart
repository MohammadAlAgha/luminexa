import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/listsWidget/notificationTile.dart';

class notificationsPage extends StatefulWidget {
  const notificationsPage({super.key});

  @override
  State<notificationsPage> createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
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
