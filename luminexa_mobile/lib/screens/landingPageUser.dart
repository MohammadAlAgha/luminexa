import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/listWidget.dart';

class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  final List systems = ["Kitchen", "Room", "Living Room"];
  final List leds = [3, 2, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Name",
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
          icon: Icon(Icons.menu),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        systemName: systems[index], activeLeds: leds[index]);
                  }),
              SizedBox(
                height: 320,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: iconButton(
                  innerText: "Add new system",
                  iconName: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
