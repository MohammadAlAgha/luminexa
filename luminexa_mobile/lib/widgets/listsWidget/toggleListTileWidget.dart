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
        child: SwitchListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              fontFamily: "RalewayNormal",
              fontSize: 17,
              color: Color.fromARGB(255, 63, 139, 0),
            ),
          ),
          subtitle: Text(
            widget.subTitle ?? "Edit Mode",
            style: TextStyle(
                fontFamily: "RalewayBold",
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
          value: status,
          onChanged: setStatus,
        ));
  }
}
