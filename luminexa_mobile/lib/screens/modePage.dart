import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/toggleListTileWidget.dart';

class modePage extends StatefulWidget {
  const modePage({super.key});

  @override
  State<modePage> createState() => _modePageState();
}

class _modePageState extends State<modePage> {
  final List modes = ["Dinner Mode", "Movie night mode", "Study mode"];
  final List status = ["of", "on", "off"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Row(
            children: [
              Text(
                "Modes",
                style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return toggleListTile(
                title: modes[index],
                status: status[index],
              );
            }),
        Padding(
          padding: const EdgeInsets.all(25),
          child:
              iconButton(innerText: "Set new mode", iconName: Icon(Icons.add)),
        )
      ],
    )));
  }
}
