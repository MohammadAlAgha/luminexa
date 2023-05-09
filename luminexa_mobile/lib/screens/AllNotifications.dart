import 'package:flutter/material.dart';
import 'package:luminexa_mobile/helpers/timeHelpers.dart';
import 'package:luminexa_mobile/models/notificationModel.dart';
import 'package:luminexa_mobile/providers/NotificationsProvider.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/notificationTile.dart';
import 'package:provider/provider.dart';

class AllNotifications extends StatefulWidget {
  const AllNotifications({super.key});

  @override
  State<AllNotifications> createState() => _AllNotificationsState();
}

class _AllNotificationsState extends State<AllNotifications> {
  Future<void> getNotifications() async {
    await Provider.of<NotificationsProvider>(context, listen: false)
        .getNotifications();
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Notifications",
        iconLeading: Icon(Icons.arrow_back),
        iconLeadingFunction: () {
          Navigator.of(context).pop(context);
        },
      ),
      body: Consumer<NotificationsProvider>(
        builder: (context, value, child) {
          List<Notifications> _notifications = value.notifications;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: ScrollPhysics(parent: null),
                      shrinkWrap: true,
                      itemCount: _notifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        return notificationTile(
                          title: _notifications[index].description,
                          time: '${getTimeFormat(_notifications[index].time)}',
                        );
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
