import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/drawerWidget/drawer.dart';
import 'package:luminexa_mobile/widgets/listsWidget/listWidget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List systems = ["Kitchen", "Room", "Living Room"];
  final List leds = [3, 2, 5];

  final newSystem = TextEditingController();

  void addSystem() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add the system serial number"),
            content: sytledTextField(
              isPass: false,
              controller: newSystem,
              label: "Serial Number",
              hintText: "Serial Number",
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: styledButton(
                  innerText: "Connect",
                  onTap: () {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: styledButton(
                  innerText: "Cancel",
                  onTap: () {
                    Navigator.of(context).pop();
                    newSystem.clear();
                  },
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerWidget(),
      appBar: appBar(
        title: "Kitchen",
        iconAction: Icon(Icons.settings),
        iconActionFunction: () =>
            Navigator.of(context).pushNamed(RouteManager.settingsPage),
        iconLeading: Icon(Icons.arrow_back),
        iconLeadingFunction: () => Navigator.of(context).pop(context),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 30),
                        child: Text(
                          "Systems",
                          style: TextStyle(
                              fontFamily: "RalewayBold",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: systems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listOption(
                            systemName: systems[index],
                            activeLeds: leds[index]);
                      }),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white,
                      Colors.white,
                    ])),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 20, top: 60),
                width: MediaQuery.of(context).size.width,
                child: iconButton(
                    innerText: "Add new system",
                    iconName: Icon(Icons.add),
                    onTap: addSystem),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
