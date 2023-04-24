import 'package:flutter/material.dart';

class toggleTileList extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String status;

  const toggleTileList({
    super.key,
    required this.title,
    this.subTitle,
    required this.status,
  });

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
            title,
            style: TextStyle(
              fontFamily: "RalewayNormal",
              fontSize: 17,
              color: Color.fromARGB(255, 63, 139, 0),
            ),
          ),
          subtitle: Text(
            subTitle ?? "Edit Mode",
            style: TextStyle(
                fontFamily: "RalewayBold",
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
          trailing: status == "on"
              ? Icon(
                  Icons.toggle_on,
                  size: 40,
                  color: Color.fromARGB(255, 188, 236, 147),
                )
              : Icon(
                  Icons.toggle_off,
                  size: 40,
                  color: Color.fromARGB(255, 179, 179, 179),
                ),
        ));
  }
}
