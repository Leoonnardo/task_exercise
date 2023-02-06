import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 56, 128, 167);
  static const Color secundary = Color(0xFF21A8A8);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //COlor primario
      primaryColor: primary,

      //Appbar theme
      appBarTheme:
          const AppBarTheme(color: primary, elevation: 0, centerTitle: true),
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primary));
}
