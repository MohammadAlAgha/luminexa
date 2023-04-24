import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';

class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 173, 173, 173)),
                      )),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Kitchen",
                            style: TextStyle(
                              fontFamily: "RalewayNormal",
                              fontSize: 15,
                              color: Color.fromARGB(255, 63, 139, 0),
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "3 Active LEDS",
                            style: TextStyle(
                                fontFamily: "RalewayBold",
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 320,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: iconButton(
                  innerText: "Add new system",
                  iconName: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
