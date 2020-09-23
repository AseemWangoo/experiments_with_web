import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightPrimaryColor = Colors.orange;
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryAppBarColor = Colors.white;

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: _lightPrimaryColor,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.black),
    ),
    fontFamily: ApplevelConstants.fontFamily,
  );

  static final darkTheme = ThemeData(
    // scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: _darkPrimaryAppBarColor,
      iconTheme: IconThemeData(color: _darkPrimaryColor),
    ),

    fontFamily: ApplevelConstants.fontFamily,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: _lightPrimaryColor,
    ),

    // TEXTS
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.black),
      headline1: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 96.0,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 60.0,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 48.0,
        letterSpacing: 0.0,
      ),
      headline4: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 34.0,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        letterSpacing: 0.0,
        fontSize: 25.0,
      ),
      headline6: TextStyle(
        letterSpacing: 0.15,
        fontSize: 20.0,
      ),
    ),
  );
}
