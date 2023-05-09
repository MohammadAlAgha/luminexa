import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class EditLeds extends StatefulWidget {
  final Led led;
  final String systemId;
  final config;
  EditLeds({
    super.key,
    required this.led,
    required this.systemId,
    required this.config,
  });

  @override
  State<EditLeds> createState() => _EditLedsState();
}

class _EditLedsState extends State<EditLeds> {
  String dropDownSelected = "standard";

  void _onTap() {
    widget.config
        ? Provider.of<LedsProvider>(context, listen: false).editConfigs(
            widget.systemId,
            widget.led.id,
            widget.led.ledStatus,
            widget.led.intensity,
            widget.led.color,
          )
        : Provider.of<LedsProvider>(context, listen: false).editLed(
            widget.systemId,
            widget.led.id,
            widget.led.ledStatus,
            widget.led.intensity,
            widget.led.color,
            context,
          );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: widget.led.ledName,
        iconLeading: Icon(Icons.arrow_back),
        iconLeadingFunction: () {
          Navigator.of(context).pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            titleWidget(
              title: "LED Status",
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.led.ledStatus == "on"
                    ? Switch(
                        value: true,
                        onChanged: (value) {
                          widget.led.intensity == 0
                              ? setState(() {
                                  widget.led.ledStatus = "off";
                                })
                              : value == true
                                  ? setState(() {
                                      widget.led.ledStatus = "on";
                                    })
                                  : setState(() {
                                      widget.led.ledStatus = "off";
                                    });
                        })
                    : Switch(
                        value: false,
                        onChanged: (value) {
                          widget.led.intensity == 0
                              ? setState(() {
                                  widget.led.ledStatus = "off";
                                })
                              : setState(() {
                                  widget.led.ledStatus = "on";
                                });
                        }),
                Text(
                  widget.led.ledStatus == "on" ? "ON" : "OFF",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            titleWidget(title: "LED Intensity"),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.led.intensity.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Slider(
                min: 0,
                max: 100,
                value: widget.led.intensity.toDouble(),
                onChanged: (value) {
                  setState(() {
                    widget.led.intensity = value.toInt();
                  });
                }),
            SizedBox(
              height: 30,
            ),
            titleWidget(title: "LED Color"),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
                value: widget.led.color,
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
                    value: dropDownSelected,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Red",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "red",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Blue",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "blue",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Green",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "green",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Yellow",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "yellow",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Purple",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "purple",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Orange",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    value: "orange",
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    widget.led.color = value!;
                  });
                }),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
              child: styledButton(
                innerText: "Save Changes",
                onTap: _onTap,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
