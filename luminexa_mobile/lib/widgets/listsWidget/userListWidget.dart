import 'package:flutter/material.dart';

class userListTile extends StatefulWidget {
  final int index;
  final String user;
  final String type;
  const userListTile({
    super.key,
    required this.index,
    required this.user,
    required this.type,
  });

  @override
  State<userListTile> createState() => _userListTileState();
}

class _userListTileState extends State<userListTile> {
  @override
  Widget build(BuildContext context) {
    return widget.index % 2 == 0
        ? Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.user,
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 17),
                  ),
                  Text(
                    widget.type,
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 17),
                  ),
                ]),
          )
        : Container(
            height: 50,
            color: Color.fromARGB(255, 245, 245, 245),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.user,
                    style: TextStyle(
                        fontFamily: "RalewayBold",
                        fontSize: 17,
                        color: Colors.black),
                  ),
                  Text(
                    widget.type,
                    style: TextStyle(
                        fontFamily: "RalewayBold",
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ]),
          );
  }
}
