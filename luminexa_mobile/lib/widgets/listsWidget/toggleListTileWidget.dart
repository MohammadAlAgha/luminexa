import 'package:flutter/material.dart';
import 'package:luminexa_mobile/providers/ModesProvider.dart';
import 'package:luminexa_mobile/providers/SchedulesProvider.dart';
import 'package:provider/provider.dart';

class toggleListTile extends StatefulWidget {
  final String title;
  final String? subTitle;
  String status;
  final String systemId;
  final String id;
  final String condition;

  toggleListTile({
    super.key,
    required this.title,
    this.subTitle,
    required this.status,
    required this.systemId,
    required this.id,
    required this.condition,
  });

  @override
  State<toggleListTile> createState() => _toggleTileListState();
}

class _toggleTileListState extends State<toggleListTile> {
  void setStatus(value) {
    if (widget.condition == "mode") {
      Provider.of<ModesProvider>(context, listen: false)
          .toggleMode(widget.systemId, widget.id);
    }
    Provider.of<SchedulesProvider>(context, listen: false)
        .toggleSchedule(widget.systemId, widget.id);
  }

  @override
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
