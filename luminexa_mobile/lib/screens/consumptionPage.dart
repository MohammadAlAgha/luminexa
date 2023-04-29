import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/systemButton.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class consumptionPage extends StatefulWidget {
  const consumptionPage({super.key});

  @override
  State<consumptionPage> createState() => _consumptionPageState();
}

class _consumptionPageState extends State<consumptionPage> {
  List<Map> systems = [
    {
      "name": "Kitchen",
      "isOn": false,
    },
    {
      "name": "Room",
      "isOn": true,
    },
    {
      "name": "Living Room",
      "isOn": false,
    },
    {
      "name": "Hallway",
      "isOn": false,
    },
    {
      "name": "Room1",
      "isOn": false,
    },
    {
      "name": "Room2",
      "isOn": false,
    },
    {
      "name": "Room3",
      "isOn": false,
    },
    {
      "name": "Bathroom",
      "isOn": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          titleWidget(title: "Systems"),
          SizedBox(
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: systems.length,
              itemBuilder: (context, index) {
                return systemButton(
                  innerText: systems[index]["name"],
                  onTap: () {},
                  isPressed: systems[index]["isOn"],
                );
              },
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          )
        ],
      )),
    );
  }
}
