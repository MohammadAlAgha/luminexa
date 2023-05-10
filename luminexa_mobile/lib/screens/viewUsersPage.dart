import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/systemButton.dart';

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
              padding: EdgeInsets.only(bottom: 70),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: ScrollPhysics(parent: null),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Dismissible(
                            key: Key(user['name']),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.endToStart) {
                                // set user as host
                              } else if (direction ==
                                  DismissDirection.startToEnd) {
                                // delete user
                              }
                            },
                            background: Container(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.person_add),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Set as host",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    )
                                  ],
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Delete user",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    Icon(Icons.delete),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                            child: ListTile(
                              title: Text(
                                user['name'],
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              subtitle: Text(
                                user['type'],
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
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
                        Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.9),
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).scaffoldBackgroundColor,
                      ]),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: iconButton(
                  innerText: "Add new user",
                  iconName: Icon(Icons.add),
                  onTap: addUser,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
