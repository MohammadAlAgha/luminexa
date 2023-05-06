import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/systemModel.dart';
import 'package:luminexa_mobile/routes/routes.dart';

class listOption extends StatelessWidget {
  final System system;
  final int activeLeds;

  const listOption({
    super.key,
    required this.system,
    required this.activeLeds,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteManager.systemPage, arguments: {
          "systemId": system.id,
          "systemName": system.systemName,
        });
      },
      child: Container(
        height: 75,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(color: Color.fromARGB(255, 173, 173, 173)),
        )),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              system.systemName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("$activeLeds Active LEDS",
                style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ),
    );
  }
}
