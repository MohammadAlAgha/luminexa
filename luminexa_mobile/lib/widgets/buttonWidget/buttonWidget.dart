import 'package:flutter/material.dart';

class styledButton extends StatelessWidget {
  final String innerText;
  final Function()? onTap;

  const styledButton({
    super.key,
    required this.innerText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 188, 236, 147),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
            child: Text(
          innerText,
          style: TextStyle(
              fontFamily: "Raleway", fontSize: 17, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
