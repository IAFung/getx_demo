import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData normalTheme = ThemeData(
      primarySwatch: Colors.purple,
      canvasColor: Color.fromRGBO(255, 254, 222, 1.0),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w800, color: Colors.green)));

  static ThemeData pinkTheme = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: Color.fromRGBO(255, 254, 222, 1.0),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.pink)));
}
