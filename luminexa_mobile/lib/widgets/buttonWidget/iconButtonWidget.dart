import 'package:flutter/material.dart';

class iconButton extends StatelessWidget {
  final String innerText;
  final Widget iconName;
  final Function()? onTap;

  const iconButton({
    super.key,
    required this.innerText,
    required this.iconName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: iconName,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.only(right: 2.0),
              constraints: BoxConstraints(),
            ),
            Text(innerText, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
