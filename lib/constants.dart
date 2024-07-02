import 'package:flutter/material.dart';

class AppColors {
  static final ThemeData myTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primary,
      secondary: Colors.deepOrangeAccent,
    ),
    scaffoldBackgroundColor:
        primary, // Set the default background color for Scaffold
  );

  static const Color primary = Color(0xFF191b1f);
  static const Color secondary = Color(0xFF111418);
  static const Color secondaryText = Color(0xFF111418);
  static const Color success = Color(0xFF00FF00);
  static const Color danger = Color(0xFFFF0000);
  static const Color warning = Color(0xFFFFA500);
  static const Color info = Color(0xFF0000FF);
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF333333);
}
