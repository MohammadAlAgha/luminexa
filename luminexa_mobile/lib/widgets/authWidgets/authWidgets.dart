import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sytledTextField extends StatefulWidget {
  final bool isPass;
  final controller;
  final String label;
  final String hintText;
  final InputDecorationTheme? decoration;

  sytledTextField({
    super.key,
    required this.isPass,
    required this.controller,
    required this.label,
    required this.hintText,
    this.decoration,
  });

  @override
  State<sytledTextField> createState() => _sytledTextFieldState();
}

class _sytledTextFieldState extends State<sytledTextField> {
  bool passwordVisible = true;

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final check = prefs.getBool("isDark");

    return check ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return !widget.isPass
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: widget.controller,
              obscureText: false,
              decoration: InputDecoration(
                enabledBorder: widget.decoration?.border,
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
                enabledBorder: widget.decoration?.border,
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
