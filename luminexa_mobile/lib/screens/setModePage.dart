import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/ledModel.dart';
import 'package:luminexa_mobile/providers/LedsProvider.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/ledsListWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class SetModePage extends StatefulWidget {
  final String systemId;

  SetModePage({
    super.key,
    required this.systemId,
  });

  @override
  State<SetModePage> createState() => _SetModePageState();
}

class _SetModePageState extends State<SetModePage> {
  final modeController = TextEditingController();

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
    return Consumer<LedsProvider>(
      builder: (context, value, child) {
        List<Led> _leds = value.leds;
        return Scaffold(
          appBar: appBar(
            title: "Set Mode",
            iconLeading: Icon(Icons.arrow_back),
            iconLeadingFunction: () {
              Navigator.pop(context);
            },
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              titleWidget(title: "Title of the schedule"),
              SizedBox(
                height: 10,
              ),
              sytledTextField(
                  isPass: false,
                  controller: modeController,
                  label: "Title",
                  hintText: "Title"),
              SizedBox(
                height: 30,
              ),
              titleWidget(title: "LEDs in Kitchen"),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemCount: _leds.length,
                itemBuilder: (BuildContext context, int index) {
                  return ledListOption(
                      system: widget.systemId,
                      led: _leds[index],
                      ledName: _leds[index].ledName,
                      status: _leds[index].ledStatus);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: styledButton(
                  innerText: "Set Mode",
                  onTap: () {},
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
