import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:luminexa_mobile/screens/notificationPage.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationsPage(),
    );
  }
}
