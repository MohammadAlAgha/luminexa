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
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Center(
          child: Text(
            innerText,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
