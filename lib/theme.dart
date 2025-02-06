import 'package:flutter/material.dart';

final primaryColor = Colors.blue;

final themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            textStyle: TextStyle(fontSize: 24))),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.blue,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey, width: 1),
      ),
      labelStyle: TextStyle(color: Colors.white, fontSize: 16),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    
    textTheme: TextTheme(labelSmall: TextStyle(fontSize: 100)));
