import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/systemButton.dart';
import 'package:luminexa_mobile/widgets/listsWidget/userListWidget.dart';

class ViewUsers extends StatefulWidget {
  const ViewUsers({super.key});

  @override
  State<ViewUsers> createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  final newUser = TextEditingController();

  void addUser() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text("Add the user email"),
            content: styledTextField(
              decoration: Theme.of(context).inputDecorationTheme,
              isPass: false,
              controller: newUser,
              label: "User Email",
              hintText: "User Email",
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: systemButton(
                  isPressed: false,
                  innerText: "Invite",
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, bottom: 25, top: 10),
                child: systemButton(
                  isPressed: false,
                  innerText: "Cancel",
                  onTap: () {
                    Navigator.of(context).pop();
                    newUser.clear();
                  },
                ),
              ),
            ],
          );
        });
  }

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
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall),
                                          Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.black,
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                        Icon(
                                          Icons.person_add,
                                          size: 20,
                                          color: Colors.black,
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
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.8),
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: iconButton(
                  innerText: "Add New User",
                  iconName: Icon(Icons.add),
                  onTap: addUser,
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "User Name",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "User Type",
                        style: Theme.of(context).textTheme.headlineMedium,
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
