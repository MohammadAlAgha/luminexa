import 'package:flutter/material.dart';
import 'package:luminexa_mobile/helpers/timeHelpers.dart';
import 'package:luminexa_mobile/models/scheduleModel.dart';
import 'package:luminexa_mobile/providers/SchedulesProvider.dart';
import 'package:luminexa_mobile/providers/SystemsProvider.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/toggleListTileWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    titleWidget(title: "Schedules"),
                    ListView.builder(
                      physics: ScrollPhysics(parent: null),
                      shrinkWrap: true,
                      itemCount: _schedules.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: ValueKey<Schedule>(_schedules[index]),
                          onDismissed: (DismissDirection direction) async {
                            await Provider.of<SchedulesProvider>(context,
                                    listen: false)
                                .deleteSchedule(
                                    widget.systemId, _schedules[index].id);
                            setState(() {
                              _schedules.removeAt(index);
                            });
                          },
                          background: Container(
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          child: toggleListTile(
                            condition: "schedule",
                            id: _schedules[index].id,
                            systemId: widget.systemId,
                            title: _schedules[index].scheduleTitle,
                            subTitle:
                                '${getTimeFormat(_schedules[index].timeStart)} - ${getTimeFormat(_schedules[index].timeEnd)}',
                            status: _schedules[index].scheduleStatus,
                          ),
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
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.8),
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ]),
                  ),
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
