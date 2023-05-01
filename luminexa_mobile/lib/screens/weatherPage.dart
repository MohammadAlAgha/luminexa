import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';

class WeatherPage extends StatelessWidget {
  DateTime todayDate = DateTime.now();
  WeatherPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Weather Status",
        iconLeading: Icon(Icons.arrow_back),
        iconLeadingFunction: () {
          Navigator.of(context).pop(context);
        },
      ),
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
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      todayDate.year.toString() +
                          "/" +
                          todayDate.month.toString() +
                          "/" +
                          todayDate.day.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
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
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "34",
                      style: TextStyle(fontSize: 30, color: Colors.black),
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
                          style: Theme.of(context).textTheme.bodySmall,
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
                            color: Theme.of(context).canvasColor,
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "88%",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        )),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "1.68%",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        )),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                "13 km/h",
                                style: Theme.of(context).textTheme.titleMedium,
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
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "The weather seems sunny outside,the LEDs can be turned off",
              style: Theme.of(context).textTheme.displaySmall,
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
