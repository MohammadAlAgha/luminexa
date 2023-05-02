import 'package:flutter/material.dart';

class sytledTextField extends StatefulWidget {
  final bool isPass;
  final controller;
  final String label;
  final String hintText;

  sytledTextField({
    super.key,
    required this.isPass,
    required this.controller,
    required this.label,
    required this.hintText,
  });

  @override
  State<sytledTextField> createState() => _sytledTextFieldState();
}

class _sytledTextFieldState extends State<sytledTextField> {
  @override
  bool passwordVisible = true;

  Widget build(BuildContext context) {
    return !widget.isPass
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: widget.controller,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: widget.hintText,
                label: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                hintStyle: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: widget.controller,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                hintText: widget.hintText,
                label: Text(widget.label,
                    style: Theme.of(context).textTheme.displayMedium),
                hintStyle: Theme.of(context).textTheme.displayMedium,
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
          );
  }
}
