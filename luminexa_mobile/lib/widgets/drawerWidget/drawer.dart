import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/drawerButtonWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      width: 220,
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/Logo.svg'),
                ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              drawerButton(
                  innerText: "Weather",
                  iconName: Icon(Icons.sunny),
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteManager.weatherPage);
                  }),
              SizedBox(
                height: 20,
              ),
              drawerButton(
                innerText: "Notifications",
                iconName: Icon(Icons.notifications),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RouteManager.allNotifications);
                },
              ),
              SizedBox(
                height: 400,
              ),
              drawerButton(
                  innerText: "Log Out",
                  iconName: Icon(Icons.logout),
                  onTap: () async {
                    Navigator.of(context).pop(context);
                    Navigator.of(context).popAndPushNamed(RouteManager.login);
                    final prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                  }),
            ]),
          )
        ],
      )),
    );
  }
}
