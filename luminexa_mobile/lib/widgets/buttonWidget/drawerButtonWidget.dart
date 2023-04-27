import 'package:flutter/material.dart';

class drawerButton extends StatelessWidget {
  final String innerText;
  final Widget iconName;

  const drawerButton({
    super.key,
    required this.innerText,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Color.fromARGB(255, 188, 236, 147),
              style: BorderStyle.solid,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: iconName,
                color: Color.fromARGB(255, 188, 236, 147),
                padding: EdgeInsets.only(right: 2.0),
                constraints: BoxConstraints(),
                iconSize: 18,
              ),
              Text(
                innerText,
                style: TextStyle(
                    color: Color.fromARGB(255, 188, 236, 147),
                    fontFamily: "Raleway",
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
