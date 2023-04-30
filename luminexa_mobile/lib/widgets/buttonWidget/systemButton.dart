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
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text(
                widget.innerText,
                style: Theme.of(context).textTheme.displaySmall,
              )),
            ),
          )
        : GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Center(
                  child: Text(
                widget.innerText,
                style: Theme.of(context).textTheme.displaySmall,
              )),
            ),
          );
  }
}
