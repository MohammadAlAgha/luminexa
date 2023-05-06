import 'package:flutter/material.dart';

class toggleListTile extends StatefulWidget {
  final String title;
  final String? subTitle;
  String status;

  toggleListTile({
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
  void setStatus(value) {
    setState(() {
      widget.status = value;
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
          trailing: widget.status == "on"
              ? Switch(
                  activeColor: Theme.of(context).canvasColor,
                  value: true,
                  onChanged: setStatus,
                )
              : Switch(
                  activeColor: Theme.of(context).canvasColor,
                  value: false,
                  onChanged: setStatus,
                ),
        ));
  }
}
