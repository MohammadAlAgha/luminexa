import 'package:flutter/material.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
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
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(MaterialPageRoute(builder: (BuildContext context) {
              return settingsPage();
            }));
          },
          icon: Icon(Icons.arrow_back),
        ),
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
