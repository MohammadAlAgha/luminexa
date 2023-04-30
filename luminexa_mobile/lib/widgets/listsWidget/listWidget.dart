import 'package:flutter/material.dart';

class listOption extends StatelessWidget {
  final String systemName;
  final int activeLeds;

  const listOption({
    super.key,
    required this.systemName,
    required this.activeLeds,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: Color.fromARGB(255, 173, 173, 173)),
      )),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            systemName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("$activeLeds Active LEDS",
              style: Theme.of(context).textTheme.labelLarge),
        ),
      ),
    );
  }
}
