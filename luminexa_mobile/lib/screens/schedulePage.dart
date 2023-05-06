import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/providers/SchedulesProvider.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/toggleListTileWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  final String systemId;
  const SchedulePage({
    super.key,
    required this.systemId,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  Future fetchSchedules() async {
    Provider.of<SchedulesProvider>(context, listen: false)
        .getSchedules(widget.systemId);
  }

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SchedulesProvider>(
      builder: (context, value, child) {
        List<Schedule> _schedules = value.schedules;

        return SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    // titleWidget(title: "Upcoming schedule"),
                    // toggleListTile(
                    //   title: _schedules[0].scheduleTitle,
                    //   subTitle:
                    //       '${_schedules[0].timeStart.toString()}, ${_schedules[0].timeEnd.toString()}',
                    //   status: _schedules[0].scheduleStatus,
                    // ),
                    titleWidget(title: "Schedules"),
                    ListView.builder(
                      physics: ScrollPhysics(parent: null),
                      shrinkWrap: true,
                      itemCount: _schedules.length,
                      itemBuilder: (BuildContext context, int index) {
                        return toggleListTile(
                          title: _schedules[index].scheduleTitle,
                          subTitle:
                              '${_schedules[index].timeStart.toString()}, ${_schedules[index].timeEnd.toString()}',
                          status: _schedules[index].scheduleTitle,
                        );
                      },
                    ),
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
                        Colors.white.withOpacity(0.6),
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255),
                      ])),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  child: iconButton(
                    innerText: "Set new schedule",
                    iconName: Icon(Icons.alarm_add),
                    onTap: () => Navigator.of(context).pushNamed(
                      RouteManager.setSchedulePage,
                      arguments: {
                        "systemId": widget.systemId,
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
