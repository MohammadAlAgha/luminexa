import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class SetModePage extends StatelessWidget {
  SetModePage({super.key});

  final modeController = TextEditingController();
  final leds = ["LED 1", "LED 2", "LED 3", "LED 4"];
  final status = ["ON", "OFF", "OFF", "ON"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Set Mode",
        iconLeading: Icon(Icons.arrow_back),
        iconLeadingFunction: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          titleWidget(title: "Title of the schedule"),
          SizedBox(
            height: 10,
          ),
          sytledTextField(
              isPass: false,
              controller: modeController,
              label: "Title",
              hintText: "Title"),
          SizedBox(
            height: 30,
          ),
          titleWidget(title: "LEDs in Kitchen"),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: ScrollPhysics(parent: null),
            shrinkWrap: true,
            itemCount: leds.length,
            itemBuilder: (BuildContext context, int index) {
              return ledListOption(ledName: leds[index], status: status[index]);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: styledButton(
              innerText: "Set Mode",
              onTap: () {},
            ),
          )
        ],
      )),
    );
  }
}
