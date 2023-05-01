import 'package:flutter/material.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/toggleListTileWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';

class ModePage extends StatefulWidget {
  const ModePage({super.key});

  @override
  State<ModePage> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  final List modes = [
    "Dinner Mode",
    "Movie night mode",
    "Study mode",
    "mode 1",
    "mode 1",
    "mode 1",
    "mode 1",
    "mode 1",
  ];
  final List status = [
    "of",
    "on",
    "off",
    "on",
    "on",
    "on",
    "on",
    "on",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                titleWidget(title: "Modes"),
                ListView.builder(
                    physics: ScrollPhysics(parent: null),
                    shrinkWrap: true,
                    itemCount: modes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return toggleListTile(
                        title: modes[index],
                        status: status[index],
                      );
                    }),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ])),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: iconButton(
                innerText: "Set new mode",
                iconName: Icon(Icons.bookmark_add_outlined),
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteManager.setModePage),
              ),
            ),
          )
        ],
      ),
    );
  }
}
