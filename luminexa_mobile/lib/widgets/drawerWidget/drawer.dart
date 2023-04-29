import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/drawerButtonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 63, 139, 0),
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
              drawerButton(innerText: "Weather", iconName: Icon(Icons.sunny)),
              SizedBox(
                height: 20,
              ),
              drawerButton(
                  innerText: "Notifications",
                  iconName: Icon(Icons.notifications)),
              SizedBox(
                height: 400,
              ),
              drawerButton(innerText: "Log Out", iconName: Icon(Icons.logout)),
            ]),
          )
        ],
      )),
    );
  }
}
