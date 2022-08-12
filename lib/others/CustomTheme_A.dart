import 'package:flutter/material.dart';

class CustomTheme {
  static const double _CardBorderWidtd = 2;
  static const double _CardElevatiom = 20;
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.red,
    // colorScheme: ColorScheme.light().copyWith(primary: Colors.red),
    primarySwatch: Colors.red,
    cardTheme: CardTheme(
        color: Colors.red[100],
        shape: Border.all(width: _CardBorderWidtd, color: Colors.red),
        elevation: _CardElevatiom),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    // colorScheme: ColorScheme.light().copyWith(primary: Colors.grey),
    primarySwatch: Colors.grey,
    cardTheme: CardTheme(
        color: Colors.grey[100],
        shape: Border.all(width: _CardBorderWidtd, color: Colors.black45),
        elevation: _CardElevatiom),
  );
}
