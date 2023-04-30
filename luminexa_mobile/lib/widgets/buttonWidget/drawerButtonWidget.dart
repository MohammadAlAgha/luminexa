import 'package:flutter/material.dart';

class drawerButton extends StatelessWidget {
  final String innerText;
  final Widget iconName;
  final Function()? onTap;

  const drawerButton({
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
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.black,
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
                color: Colors.black,
                padding: EdgeInsets.only(right: 2.0),
                constraints: BoxConstraints(),
                iconSize: 18,
              ),
              Text(
                innerText,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
