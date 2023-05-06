import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class LedsPage extends StatefulWidget {
  final String systemId;

  const LedsPage({
    required this.systemId,
    super.key,
  });

  @override
  State<LedsPage> createState() => _LedsPageState();
}

class _LedsPageState extends State<LedsPage> {
  Future<void> fetchLeds() async {
    await Provider.of<LedsProvider>(context, listen: false)
        .getLeds(widget.systemId);
  }

  @override
  void initState() {
    super.initState();
    fetchLeds();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LedsProvider>(builder: (context, value, child) {
      List<Led> _leds = value.leds;

      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleWidget(title: "Edite LEDs in Kitchen"),
              ListView.builder(
                physics: ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemCount: _leds.length,
                itemBuilder: (BuildContext context, int index) {
                  return ledListOption(
                      led: _leds[index],
                      ledName: _leds[index].ledName,
                      status: _leds[index].ledStatus);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
