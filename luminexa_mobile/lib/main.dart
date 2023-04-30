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
          primarySwatch: Colors.green, scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      // initialRoute: RouteManager.login,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
