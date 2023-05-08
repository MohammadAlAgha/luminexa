import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/modeModel.dart';
import 'package:luminexa_mobile/providers/ModesProvider.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/toggleListTileWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class ModePage extends StatefulWidget {
  final String systemId;
  const ModePage({
    super.key,
    required this.systemId,
  });

  @override
  State<ModePage> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  Future fetchModes() async {
    await Provider.of<ModesProvider>(context, listen: false)
        .getModes(widget.systemId);
  }

  @override
  void initState() {
    super.initState();
    fetchModes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModesProvider>(builder: (context, value, child) {
      List<Mode> _modes = value.modes;

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
                      itemCount: _modes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return toggleListTile(
                          title: _modes[index].modeName,
                          status: _modes[index].modeStatus,
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
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.8),
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: iconButton(
                  innerText: "Set new mode",
                  iconName: Icon(Icons.bookmark_add_outlined),
                  onTap: () => Navigator.of(context).pushNamed(
                      RouteManager.setModePage,
                      arguments: {"systemId": widget.systemId}),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
