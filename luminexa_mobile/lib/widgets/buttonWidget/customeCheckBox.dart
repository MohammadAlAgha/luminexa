import 'package:flutter/material.dart';

class customeCheckBox extends StatefulWidget {
  final String day;
  final bool isPressed;

  const customeCheckBox({
    super.key,
    required this.day,
    required this.isPressed,
  });

  @override
  State<customeCheckBox> createState() => _customeCheckBoxState();
}

class _customeCheckBoxState extends State<customeCheckBox> {
  @override
  Widget build(BuildContext context) {
    return !widget.isPressed
        ? GestureDetector(
            onTap: () {
              setState(() {
                widget.isPressed != widget.isPressed;
              });
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(
                    color: Color.fromARGB(255, 63, 139, 0),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.day,
                    style: TextStyle(
                      fontFamily: "RalewayBold",
                      fontSize: 10,
                      color: Color.fromARGB(255, 63, 139, 0),
                    ),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                widget.isPressed != widget.isPressed;
              });
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Color.fromARGB(255, 63, 139, 0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.day,
                    style: TextStyle(
                        fontFamily: "RalewayBold",
                        fontSize: 10,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          );
  }
}
