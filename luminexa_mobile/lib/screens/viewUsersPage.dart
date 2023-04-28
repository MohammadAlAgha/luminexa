import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/userListWidget.dart';

class viewUsers extends StatefulWidget {
  const viewUsers({super.key});

  @override
  State<viewUsers> createState() => _viewUsersState();
}

class _viewUsersState extends State<viewUsers> {
  bool isOpen = false;
  List<Map> users = [
    {"name": "User 1", "type": "Host"},
    {"name": "User 1", "type": "User"},
    {"name": "User 3", "type": "User"},
    {"name": "User 4", "type": "Host"},
    {"name": "User 5", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
    {"name": "User 6", "type": "User"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Users"),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 70),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExpansionPanelList(
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        children: [
                          ExpansionPanel(
                              headerBuilder: (context, isExpanded) {
                                return userListTile(
                                    index: 1, user: "user", type: "type");
                              },
                              body: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    height: 60,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Delete User",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Raleway",
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700)),
                                          Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    height: 60,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Set a Host",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Raleway",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Icon(
                                          Icons.person_add,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              isExpanded: isOpen)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.white.withOpacity(0.6),
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 255, 255, 255),
                    ])),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: iconButton(
                  innerText: "Set New User",
                  iconName: Icon(Icons.add),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                            fontFamily: "RalewayBold",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      Text(
                        "User Type",
                        style: TextStyle(
                            fontFamily: "RalewayBold",
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
