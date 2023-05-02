import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/barChart/consumptionGraph.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/systemButton.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class ConsumptionPage extends StatefulWidget {
  const ConsumptionPage({super.key});

  @override
  State<ConsumptionPage> createState() => _ConsumptionPageState();
}

class _ConsumptionPageState extends State<ConsumptionPage> {
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

  List<double> currentIntensity = [
    4.1,
    6.2,
    10.0,
    6.4,
    8.6,
    6.1,
    12.9,
    5.2,
    8.4,
    5.5,
    14.2,
    11.1
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Consumption"),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
              child: consumptionGraph(
                consumption: currentIntensity,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
