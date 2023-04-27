import 'package:flutter/material.dart';

class appBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? iconAction;
  final Widget? iconLeading;

  const appBar({
    super.key,
    required this.title,
    this.iconAction,
    this.iconLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 24),
      ),
      centerTitle: true,
      actions: [IconButton(onPressed: () {}, icon: iconAction ?? Container())],
      leading: IconButton(
        onPressed: () {},
        icon: iconLeading ?? Container(),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 60);
}
