import 'package:flutter/material.dart';
import 'package:luminexa_mobile/routes/routes.dart';
import 'package:luminexa_mobile/screens/ConsumptionPage.dart';
import 'package:luminexa_mobile/screens/LandingPage.dart';
import 'package:luminexa_mobile/screens/LedPage.dart';
import 'package:luminexa_mobile/screens/Login.dart';
import 'package:luminexa_mobile/screens/SetSchedulePage.dart';
import 'package:luminexa_mobile/screens/SetModePage.dart';
import 'package:luminexa_mobile/screens/modePage.dart';
import 'package:luminexa_mobile/screens/schedulePage.dart';
import 'package:luminexa_mobile/screens/signUp.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';
import 'package:luminexa_mobile/screens/EditLedPage.dart';
import 'package:luminexa_mobile/screens/ViewUsersPage.dart';
import 'package:luminexa_mobile/screens/WeatherPage.dart';
import 'package:luminexa_mobile/tools/CreateMaterialColor.dart';
import 'package:luminexa_mobile/widgets/barChart/consumptionGraph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: createMaterialColor(
            Color.fromARGB(255, 63, 139, 0),
          ),
          canvasColor: Color.fromARGB(255, 188, 236, 147),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontFamily: "Raleway",
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
                color: Color.fromARGB(255, 63, 139, 0),
                fontFamily: "Raleway",
                fontSize: 17,
                fontWeight: FontWeight.w600),
            bodySmall: TextStyle(
              fontFamily: "RalewayBold",
              fontSize: 20,
              color: Colors.black,
            ),
            titleLarge: TextStyle(
              fontFamily: "RalewayNormal",
              fontSize: 17,
              color: Color.fromARGB(255, 63, 139, 0),
            ),
            titleMedium: TextStyle(
              fontFamily: "RalewayBold",
              fontSize: 17,
            ),
            titleSmall: TextStyle(
              fontFamily: "Raleway",
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            displayLarge: TextStyle(
              fontFamily: "RalewayNormal",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            displayMedium: TextStyle(
              fontFamily: "Raleway",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            displaySmall: TextStyle(
              fontFamily: "Raleway",
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            labelLarge: TextStyle(
              fontFamily: "RalewayBold",
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            labelMedium: TextStyle(
              fontFamily: "RalewayBold",
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black45,
            ),
            labelSmall: TextStyle(
              fontFamily: "RalewayBold",
              fontSize: 10,
            ),
            headlineLarge: TextStyle(
              fontSize: 12,
              fontFamily: "RalewayBold",
              color: Color.fromARGB(255, 63, 139, 0),
            ),
            headlineMedium: TextStyle(
                fontFamily: "RalewayBold", fontSize: 17, color: Colors.white),
            headlineSmall: TextStyle(fontSize: 11, fontFamily: "RalewayBold"),
          )),
      debugShowCheckedModeBanner: false,
      home: SetSchedulePage(),
      // initialRoute: RouteManager.login,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
