import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    scaffoldBackgroundColor: Color(0xFFF9FAFB),
    disabledColor: Colors.grey.shade400,
    cardColor: Color(0xFFFFFFFF),
    canvasColor: Vx.gray100,
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF5F5F5),
      elevation: 0.5,
      iconTheme: IconThemeData(color: Colors.black87),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primarySwatch: Colors.indigo,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1976D2),
        foregroundColor: Colors.white,
      ),
    ),
  );


  static ThemeData darkTheme(BuildContext context) => ThemeData(
    scaffoldBackgroundColor: darkCreamColor,
    cardColor: Colors.black,
    canvasColor: darkBluishColor,
    disabledColor: darkCreamColor,
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primarySwatch: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBluishColor,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static ThemeData citrusSunrise(BuildContext context) => ThemeData(
    scaffoldBackgroundColor: Color(0xFFD6D85D),
    disabledColor: Color(0xFFECEDB0),
    cardColor: Color(0xFFEAD8A4),
    canvasColor: Color(0xFFF68537),
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primarySwatch: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightBluishColor,
        foregroundColor: Colors.black,
      ),
    ),
  );

  static ThemeData neonTheme(BuildContext context) => ThemeData(
    scaffoldBackgroundColor: Color(0xFFFFFADC),
    disabledColor: Color(0xFFB6F500),
    cardColor: Color(0xFFA4DD00),
    canvasColor: Color(0xFF98CD00),
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primarySwatch: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightBluishColor,
        foregroundColor: Colors.black,
      ),
    ),
  );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}
