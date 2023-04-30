import 'package:flutter/material.dart';

class ledListOption extends StatelessWidget {
  final String ledName;
  final String status;

  const ledListOption({
    super.key,
    required this.ledName,
    required this.status,
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
    );
  }
}
