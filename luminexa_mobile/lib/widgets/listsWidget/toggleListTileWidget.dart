import 'package:flutter/material.dart';

class toggleListTile extends StatefulWidget {
  final String title;
  final String? subTitle;
  final String status;

  const toggleListTile({
    super.key,
    required this.title,
    this.subTitle,
    required this.status,
  });

  @override
  State<toggleListTile> createState() => _toggleTileListState();
}

class _toggleTileListState extends State<toggleListTile> {
  @override
  bool status = true;
  void setStatus(value) {
    setState(() {
      status = value;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        height: 75,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Color.fromARGB(255, 173, 173, 173)),
          ),
        ),
        child: ListTile(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            widget.subTitle ?? "Edit Mode",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          trailing: Switch(
            activeColor: Theme.of(context).canvasColor,
            value: status,
            onChanged: setStatus,
          ),
        ));
  }
}
