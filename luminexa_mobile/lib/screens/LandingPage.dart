import 'package:flutter/material.dart';
import 'package:luminexa_mobile/models/systemModel.dart';
import 'package:luminexa_mobile/providers/SystemsProvider.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/systemButton.dart';
import 'package:luminexa_mobile/widgets/drawerWidget/drawer.dart';
import 'package:luminexa_mobile/widgets/listsWidget/listWidget.dart';
import 'package:luminexa_mobile/widgets/titleWidget/titleWidget.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List leds = [3, 2, 5];

  final TextEditingController newSystem = TextEditingController();

  Future<void> fetchSystems() async {
    await Provider.of<SystemsProvider>(context, listen: false).getAllSystems();
  }

  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized();
    fetchSystems();
  }

  void addSystem() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text("Add the system serial number"),
            content: styledTextField(
              decoration: Theme.of(context).inputDecorationTheme,
              isPass: false,
              controller: newSystem,
              label: "Serial Number",
              hintText: "Serial Number",
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: systemButton(
                  isPressed: false,
                  innerText: "Connect",
                  onTap: () {
                    print(newSystem.text);
                    Provider.of<SystemsProvider>(context, listen: false)
                        .addSystem(newSystem.text);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, bottom: 25, top: 10),
                child: systemButton(
                  isPressed: false,
                  innerText: "Cancel",
                  onTap: () {
                    Navigator.of(context).pop(context);
                    newSystem.clear();
                  },
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SystemsProvider>(
      builder: (context, value, child) {
        List<System> _systems = value.systems;

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: drawerWidget(),
          appBar: AppBar(
            title: Text(
              "User Name",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(RouteManager.settingsPage);
                },
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
                      titleWidget(title: "Systems"),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _systems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return listOption(
                              system: _systems[index], activeLeds: leds[index]);
                        },
                      ),
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
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.8),
                          Theme.of(context).scaffoldBackgroundColor,
                          Theme.of(context).scaffoldBackgroundColor,
                        ])),
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, bottom: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        // if (true)
                        //   iconButton(
                        //     innerText: "View Consumption",
                        //     iconName: Icon(Icons.add),
                        //     onTap: addSystem,
                        //   ),
                        // if (true)
                        //   SizedBox(
                        //     height: 20,
                        //   ),
                        iconButton(
                          innerText: "Add new system",
                          iconName: Icon(Icons.add),
                          onTap: addSystem,
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
