import 'package:flutter/material.dart';

class customeCheckBox extends StatefulWidget {
  final String day;
  bool isPressed;
  final Function() onTap;

  customeCheckBox({
    super.key,
    required this.day,
    this.isPressed = false,
    required this.onTap,
  });

  @override
  State<customeCheckBox> createState() => _customeCheckBoxState();
}

class _customeCheckBoxState extends State<customeCheckBox> {
  void changeState() {
    setState(() {
      widget.onTap();
      widget.isPressed = !widget.isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !widget.isPressed
        ? GestureDetector(
            onTap: changeState,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.day,
                    style: TextStyle(
                      fontFamily: "RalewayBold",
                      fontSize: 10,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: changeState,
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Theme.of(context).primaryColor,
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
