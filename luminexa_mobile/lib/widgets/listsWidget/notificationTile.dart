import 'package:flutter/material.dart';

class notificationTile extends StatelessWidget {
  final String title;
  final String time;

  const notificationTile({
    super.key,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 5, 5),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          subtitle: Text(
            time,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
