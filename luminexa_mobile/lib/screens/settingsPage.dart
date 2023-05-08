import 'package:flutter/material.dart';
import 'package:luminexa_mobile/providers/ThemeProvider.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationStatus = true;
  bool DarkModeStatus = true;
  bool EnergyStatus = true;
  void setNotificationStatus(value) {
    setState(() {
      notificationStatus = value;
    });
  }

  void setDarkModeStatus(value) {
    setState(() {
      DarkModeStatus = value;
    });
  }

  void setEnergyStatus(value) {
    setState(() {
      EnergyStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        bool dark = value.isDark;

        return Scaffold(
          appBar: appBar(
            title: "Settings",
            iconLeading: Icon(Icons.arrow_back),
            iconLeadingFunction: () => Navigator.of(context).pop(context),
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Switch(
                    activeColor: Theme.of(context).canvasColor,
                    value: notificationStatus,
                    onChanged: setNotificationStatus,
                  ),
                  title: Text(
                    "Notifications",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                ListTile(
                  leading: Switch(
                    activeColor: Theme.of(context).canvasColor,
                    value: dark,
                    onChanged: (_) {
                      value.toggleTheme();
                    },
                  ),
                  title: Text(
                    "Dark mode",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                ListTile(
                  leading: Switch(
                    activeColor: Theme.of(context).canvasColor,
                    value: EnergyStatus,
                    onChanged: setEnergyStatus,
                  ),
                  title: Text(
                    "Energy saving mode",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
