import 'package:flutter/material.dart';

class appBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? iconAction;
  final Widget? iconLeading;
  final Function()? iconActionFunction;
  final Function()? iconLeadingFunction;

  const appBar({
    super.key,
    required this.title,
    this.iconAction,
    this.iconLeading,
    this.iconLeadingFunction,
    this.iconActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: iconActionFunction, icon: iconAction ?? Container())
      ],
      leading: IconButton(
        onPressed: iconLeadingFunction,
        icon: iconLeading ?? Container(),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 60);
}
