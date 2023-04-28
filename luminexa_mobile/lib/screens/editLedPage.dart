import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class editLeds extends StatefulWidget {
  editLeds({super.key});

  double sliderValue = 100;
  bool isOn = true;
  String dropDownSelected = "Standard";

  @override
  State<editLeds> createState() => _editLedsState();
}

class _editLedsState extends State<editLeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  value: widget.isOn,
                  onChanged: (value) {
                    widget.sliderValue == 0
                        ? setState(() {
                            widget.isOn = false;
                          })
                        : setState(() {
                            widget.isOn = value;
                          });
                  }),
              Text(
                widget.isOn ? "ON" : "OFF",
                style: TextStyle(fontFamily: "RalewayBold", fontSize: 15),
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
            widget.sliderValue.toStringAsFixed(0),
            style: TextStyle(fontSize: 17),
          ),
          Slider(
              min: 0,
              max: 100,
              value: widget.sliderValue,
              onChanged: (value) {
                setState(() {
                  widget.sliderValue = value;
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
              value: widget.dropDownSelected,
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
              items: const [
                DropdownMenuItem(
                  child: Text(
                    "Standard",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                  ),
                  value: "Standard",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Red",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                  ),
                  value: "Red",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Blue",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                  ),
                  value: "Blue",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Green",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                  ),
                  value: "Green",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Yellow",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                  ),
                  value: "Yellow",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Purple",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                  ),
                  value: "Purple",
                ),
                DropdownMenuItem(
                  child: Text(
                    "Orange",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                  ),
                  value: "Orange",
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  widget.dropDownSelected = value!;
                });
              }),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: styledButton(innerText: "Save Changes"),
          )
        ]),
      ),
    );
  }
}
