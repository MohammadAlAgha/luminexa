import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class editLeds extends StatefulWidget {
  editLeds({super.key});

  double sliderValue = 0;

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
          titleWidget(title: "LED Intensity"),
          SizedBox(
            height: 50,
          ),
          Text(
            widget.sliderValue.toStringAsFixed(0),
          ),
          Slider(
              min: 0,
              max: 100,
              label: widget.sliderValue.toString(),
              value: widget.sliderValue,
              onChanged: (value) {
                setState(() {
                  widget.sliderValue = value;
                });
              })
        ]),
      ),
    );
  }
}
