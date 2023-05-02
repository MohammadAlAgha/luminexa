import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class EditLeds extends StatefulWidget {
  EditLeds({super.key});

  @override
  State<EditLeds> createState() => _EditLedsState();
}

class _EditLedsState extends State<EditLeds> {
  double sliderValue = 100;
  bool isOn = true;
  String dropDownSelected = "Standard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "LED 1"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            titleWidget(
              title: "LED Status",
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: isOn,
                    onChanged: (value) {
                      sliderValue == 0
                          ? setState(() {
                              isOn = false;
                            })
                          : setState(() {
                              isOn = value;
                            });
                    }),
                Text(
                  isOn ? "ON" : "OFF",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            titleWidget(title: "LED Intensity"),
            SizedBox(
              height: 15,
            ),
            Text(
              sliderValue.toStringAsFixed(0),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Slider(
                min: 0,
                max: 100,
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                }),
            SizedBox(
              height: 50,
            ),
            titleWidget(title: "LED Color"),
            SizedBox(
              height: 15,
            ),
            DropdownButton<String>(
                value: dropDownSelected,
                borderRadius: BorderRadius.circular(25),
                icon: Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  color: Colors.green,
                  size: 18,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Standard",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "Standard",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Red",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "Red",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Blue",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "Blue",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Green",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "Green",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Yellow",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "Yellow",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Purple",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "Purple",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Orange",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "Orange",
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    dropDownSelected = value!;
                  });
                }),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: styledButton(
                innerText: "Save Changes",
                onTap: () {},
              ),
            )
          ]),
        ),
      ),
    );
  }
}
