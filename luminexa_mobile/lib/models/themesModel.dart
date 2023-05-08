import 'package:flutter/material.dart';
import 'package:luminexa_mobile/tools/CreateMaterialColor.dart';

abstract class CustomedTheme {
  static final ThemeData bright = ThemeData(
    primarySwatch: createMaterialColor(
      Color.fromARGB(255, 63, 139, 0),
    ),
    canvasColor: Color.fromARGB(255, 188, 236, 147),
    cardColor: Color.fromARGB(255, 121, 121, 121),
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
    ),
  );

  static final ThemeData dark = ThemeData(
    primarySwatch: createMaterialColor(
      Color.fromARGB(255, 63, 139, 0),
    ),
    canvasColor: Color.fromARGB(255, 63, 139, 0),
    cardColor: Color.fromARGB(255, 188, 236, 147),
    scaffoldBackgroundColor: Color.fromARGB(255, 27, 27, 27),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 188, 236, 147),
        ),
      ),
    ),
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
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontFamily: "RalewayNormal",
        fontSize: 17,
        color: Color.fromARGB(255, 188, 236, 147),
      ),
      titleMedium: TextStyle(
        fontFamily: "RalewayBold",
        fontSize: 17,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: "Raleway",
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontFamily: "RalewayNormal",
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
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
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontFamily: "RalewayBold",
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontFamily: "RalewayBold",
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.white70,
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
    ),
  );
}
