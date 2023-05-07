import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/models/systemModel.dart';
import 'package:luminexa_mobile/routes/routes.dart';

class ledListOption extends StatelessWidget {
  final String ledName;
  final String status;
  final String system;
  final bool config;
  final Led led;

  const ledListOption({
    super.key,
    required this.ledName,
    required this.status,
    required this.led,
    required this.system,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteManager.editLedPage,
            arguments: {"led": led, "systemId": system, "config": config});
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
              ledName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("status $status",
                style: Theme.of(context).textTheme.labelMedium),
          ),
        ),
      ),
    );
  }
}
