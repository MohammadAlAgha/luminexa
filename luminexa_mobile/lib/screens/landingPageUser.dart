import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/listWidget.dart';

class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  final List systems = ["Kitchen", "Room", "Living Room"];
  final List leds = [3, 2, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: styledButton(innerText: "Weather"),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: styledButton(innerText: "Notification"),
                ),
                SizedBox(
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: styledButton(innerText: "Log Out"),
                ),
              ]),
            )
          ],
        )),
      ),
      appBar: AppBar(
        title: Text(
          "User Name",
          style: TextStyle(
              fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 30),
                        child: Text(
                          "Systems",
                          style: TextStyle(
                              fontFamily: "RalewayBold",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: systems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return listOption(
                            systemName: systems[index],
                            activeLeds: leds[index]);
                      }),
                  SizedBox(
                    height: 120,
                  ),
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
                      Colors.white.withOpacity(0.5),
                      Colors.white,
                      Colors.white,
                    ])),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, bottom: 20, top: 60),
                width: MediaQuery.of(context).size.width,
                child: iconButton(
                  innerText: "Add new system",
                  iconName: Icon(Icons.add),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
