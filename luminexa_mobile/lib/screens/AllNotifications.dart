import 'package:flutter/material.dart';
import 'package:luminexa_mobile/screens/notificationPage.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({super.key});

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
      body: Scaffold(),
    );
  }
}
