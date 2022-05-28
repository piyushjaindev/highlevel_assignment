import 'package:flutter/material.dart';

import 'constants.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFF006782);
  static const Color _canvasColor = Color(0xFFFBFCFE);
  static const Color _textColor = Color(0xFF40484C);
  static const Color _fabColor = Color(0xFFB6EAFF);
  static const Color _fabIconColor = Color(0xFF001F2A);
  static const Color _buttonColor = Color(0xFFE1DFFF);
  static const Color _buttonTextcolor = Color(0xFF181837);
  static const Color _borderColor = Color(0xFF70787D);

  static const TextStyle _headline4 = TextStyle(
    fontSize: 32,
    height: 1.25,
    color: _textColor,
  );

  static const TextStyle _bodyText1 = TextStyle(
    fontSize: 22,
    height: 1.25,
    color: greenColor,
  );

  static const TextStyle _bodyText2 = TextStyle(
    fontSize: 12,
    height: 1.5,
    letterSpacing: 0.25,
    color: _textColor,
  );

  static const TextTheme _textTheme = TextTheme(
    headline4: _headline4,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    color: greenColor,
    titleTextStyle: TextStyle(
      fontSize: 32,
      height: 1.25,
      color: Colors.white,
    ),
  );

  static const FloatingActionButtonThemeData _floatingActionButtonTheme =
      FloatingActionButtonThemeData(
    backgroundColor: _fabColor,
    foregroundColor: _fabIconColor,
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    primary: _buttonColor,
    onPrimary: _buttonTextcolor,
    textStyle: _bodyText2,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ));

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    errorMaxLines: 2,
    labelStyle: const TextStyle(
      fontSize: 12,
      height: 1.33,
      fontWeight: FontWeight.w500,
      backgroundColor: Colors.white,
    ),
    floatingLabelStyle: const TextStyle(
      fontSize: 12,
      height: 1.33,
      fontWeight: FontWeight.w500,
      color: _primaryColor,
      backgroundColor: Colors.white,
    ),
    hintStyle: const TextStyle(
      fontSize: 16,
      height: 1.5,
      color: _borderColor,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: _borderColor,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: _primaryColor,
        width: 2,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  );

  static ThemeData theme = ThemeData.light().copyWith(
    primaryColor: _primaryColor,
    canvasColor: _canvasColor,
    textTheme: _textTheme,
    appBarTheme: _appBarTheme,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
