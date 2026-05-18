import 'package:flutter/material.dart';

class AppTheme {
  static const Color teamAColor = Color(0xFF4CAF50); // Green
  static const Color teamBColor = Color(0xFF2196F3); // Blue
  static const Color backgroundColor = Color(0xFFF5F5F5);

  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: teamAColor,
      secondary: teamBColor,
      surface: backgroundColor,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: teamAColor,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16),
    ),
  );
}