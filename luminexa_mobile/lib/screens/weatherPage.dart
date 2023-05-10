import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:luminexa_mobile/helpers/timeHelpers.dart';
import 'package:luminexa_mobile/providers/WeatherProvider.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/widgets/appBarWidget/appBarWidget.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  DateTime todayDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    Provider.of<WeatherProvider>(context, listen: false).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, value, child) {
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
                  height: 30,
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
                          "${value.temp}\u00b0",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            value.status == "Clouds"
                                ? Icon(
                                    Icons.cloud,
                                    size: 35,
                                  )
                                : value.status == "Clear"
                                    ? Icon(
                                        Icons.wb_sunny_rounded,
                                        size: 35,
                                      )
                                    : value.status == "Rain"
                                        ? Icon(
                                            Icons.cloudy_snowing,
                                            size: 35,
                                          )
                                        : SizedBox(
                                            height: 8,
                                          ),
                            Text(
                              value.status,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        )
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          " Sun Rise: ${getTimeFormat(value.sunRise)}",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                        Text(
                          "Sun Set: ${getTimeFormat(value.sunSet)}",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: 110,
                            height: 95,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  Text(
                                    '${value.humidity}% ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                            )),
                        Container(
                            width: 110,
                            height: 95,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  Text(
                                    ' ${value.wind} m/s',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Note",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 20,
                ),
                value.status == "Clear"
                    ? Text(
                        "The weather seems sunny outside,the LEDs should be turned off",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    : Text(
                        "The weather seems Cloudy outside,the LEDs should be turned on",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
              ],
            ),
          )),
        );
      },
    );
  }
}
