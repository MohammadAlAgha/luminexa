import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luminexa_mobile/screens/landingPageUser.dart';
import 'package:luminexa_mobile/screens/login.dart';
import 'package:luminexa_mobile/screens/setSchedulePage.dart';
import 'package:luminexa_mobile/screens/signUp.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';

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
      home: systemPage(),
    );
  }
}
