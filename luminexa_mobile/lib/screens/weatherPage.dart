import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';

class WeatherPage extends StatelessWidget {
  DateTime todayDate = DateTime.now();
  WeatherPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lebanon, Beirut",
                      style: TextStyle(fontFamily: "RalewayBold", fontSize: 16),
                    ),
                    Text(
                      todayDate.year.toString() +
                          "/" +
                          todayDate.month.toString() +
                          "/" +
                          todayDate.day.toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 188, 236, 147),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "34",
                      style: TextStyle(fontSize: 30),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 35,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Sunny",
                          style: TextStyle(
                              fontSize: 23, fontFamily: "RalewayBold"),
                        )
                      ],
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 188, 236, 147),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.thermostat,
                                size: 26,
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    fontSize: 10, fontFamily: "RalewayBold"),
                              ),
                              Text(
                                "88%",
                                style: TextStyle(
                                    fontSize: 17, fontFamily: "RalewayBold"),
                              )
                            ],
                          ),
                        )),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 188, 236, 147),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.water,
                                size: 26,
                              ),
                              Text(
                                "Water Levels",
                                style: TextStyle(
                                    fontSize: 10, fontFamily: "RalewayBold"),
                              ),
                              Text(
                                "1.68%",
                                style: TextStyle(
                                    fontSize: 17, fontFamily: "RalewayBold"),
                              )
                            ],
                          ),
                        )),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 188, 236, 147),
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.wind_power_outlined,
                                size: 26,
                              ),
                              Text(
                                "Wind Speed",
                                style: TextStyle(
                                    fontSize: 10, fontFamily: "RalewayBold"),
                              ),
                              Text(
                                "13 km/h",
                                style: TextStyle(
                                    fontSize: 17, fontFamily: "RalewayBold"),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Note",
              style: TextStyle(fontSize: 17, fontFamily: "RalewayBold"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "The weather seems sunny outside,the LEDs can be turned off",
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: styledButton(
                innerText: "Edit LEDs",
                onTap: () {},
              ),
            ),
            styledButton(
              innerText: "Turn off LEDs",
              onTap: () {},
            ),
          ],
        ),
      )),
    );
  }
}
