import 'package:flutter/material.dart';
import 'package:luminexa_mobile/helpers/timeHelpers.dart';
import 'package:luminexa_mobile/models/notificationModel.dart';
import 'package:luminexa_mobile/providers/NotificationsProvider.dart';
import 'package:luminexa_mobile/widgets/listsWidget/notificationTile.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  final String systemId;
  const NotificationsPage({
    super.key,
    required this.systemId,
  });

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Future fetchNotifications() async {
    await Provider.of<NotificationsProvider>(context, listen: false)
        .getSystemNotitifications(widget.systemId);
  }

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsProvider>(
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
    );
  }
}
