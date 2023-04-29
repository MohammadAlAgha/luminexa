import 'package:flutter/material.dart';

class systemButton extends StatefulWidget {
  final String innerText;
  final Function()? onTap;
  final bool isPressed;
  const systemButton({
    super.key,
    required this.innerText,
    required this.onTap,
    required this.isPressed,
  });

  @override
  State<systemButton> createState() => _systemButtonState();
}

class _systemButtonState extends State<systemButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isPressed
        ? GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Color.fromARGB(255, 188, 236, 147),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                widget.innerText,
                style: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              )),
            ),
          )
        : GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 63, 139, 0),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                widget.innerText,
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 63, 139, 0),
                ),
              )),
            ),
          );
  }
}
