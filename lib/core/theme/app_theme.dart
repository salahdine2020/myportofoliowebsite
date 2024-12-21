// core/theme/app_theme.dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    //accentColor: AppColors.accent,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      //headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      //bodyText1: TextStyle(fontSize: 16),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    //accentColor: AppColors.accent,
    brightness: Brightness.dark,
  );
}
