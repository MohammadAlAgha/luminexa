import 'package:flutter/material.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
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
              leading: Icon(
                Icons.toggle_on,
                size: 40,
                color: Color.fromARGB(255, 188, 236, 147),
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
              leading: Icon(
                Icons.toggle_on,
                size: 40,
                color: Color.fromARGB(255, 188, 236, 147),
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
              leading: Icon(
                Icons.toggle_off,
                size: 40,
                color: Color.fromARGB(255, 179, 179, 179),
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
