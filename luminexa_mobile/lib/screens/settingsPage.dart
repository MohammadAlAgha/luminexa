import 'package:flutter/material.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationStatus = true;
  bool DarkModeStatus = true;
  bool EnergyStatus = true;
  void setNotificationStatus(value) {
    setState(() {
      notificationStatus = value;
    });
  }

  void setDarkModeStatus(value) {
    setState(() {
      DarkModeStatus = value;
    });
  }

  void setEnergyStatus(value) {
    setState(() {
      EnergyStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Settings",
        iconLeading: Icon(Icons.arrow_back),
        iconLeadingFunction: () => Navigator.of(context).pop(context),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              leading: Switch(
                value: notificationStatus,
                onChanged: setNotificationStatus,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(
                    fontFamily: "ralewayBold",
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            ListTile(
              leading: Switch(
                value: DarkModeStatus,
                onChanged: setDarkModeStatus,
              ),
              title: Text(
                "Dark mode",
                style: TextStyle(
                    fontFamily: "ralewayBold",
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            ListTile(
              leading: Switch(
                value: EnergyStatus,
                onChanged: setEnergyStatus,
              ),
              title: Text(
                "Energy saving mode",
                style: TextStyle(
                    fontFamily: "ralewayBold",
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
