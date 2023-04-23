import 'package:flutter/material.dart';

class sytledTextField extends StatefulWidget {
  final bool isPass;
  final bool? obscureText;
  final controller;
  final String label;
  final String hintText;

  sytledTextField({
    super.key,
    required this.isPass,
    this.obscureText,
    required this.controller,
    required this.label,
    required this.hintText,
  });

  @override
  State<sytledTextField> createState() => _sytledTextFieldState();
}

class _sytledTextFieldState extends State<sytledTextField> {
  @override
  bool passwordVisible = false;

  Widget build(BuildContext context) {
    return !widget.isPass
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
                controller: widget.controller,
                obscureText: widget.obscureText ?? false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: widget.hintText,
                    label: Text(
                      widget.label,
                      style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    hintStyle: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 14,
                        fontWeight: FontWeight.w600))),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: widget.controller,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: widget.hintText,
                label: Text(
                  widget.label,
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                helperText: "Password must contain at least 8 character.",
                hintStyle: TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
          );
  }
}
