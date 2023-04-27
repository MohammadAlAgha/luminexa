import 'package:flutter/material.dart';

class appBar extends StatefulWidget with PreferredSizeWidget {
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
  State<appBar> createState() => _appBarState();

  @override
  Size get preferredSize => Size(0, 60);
}

class _appBarState extends State<appBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
            fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: widget.iconAction ?? Container())
      ],
      leading: IconButton(
        onPressed: () {},
        icon: widget.iconLeading ?? Container(),
      ),
    );
  }
}
