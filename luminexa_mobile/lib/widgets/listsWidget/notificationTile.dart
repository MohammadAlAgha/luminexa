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
        color: Color.fromARGB(255, 188, 236, 147),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 5, 5),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontFamily: "RalewayNormal",
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            time,
            style: TextStyle(
                fontFamily: "RalewayBold",
                fontWeight: FontWeight.w700,
                color: Colors.black45,
                fontSize: 12),
          ),
        ),
      ),
    );
  }
}
