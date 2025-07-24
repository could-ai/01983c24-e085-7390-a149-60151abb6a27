import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color primaryLight = Color(0xFF6200EE);
  static const Color accentLight = Color(0xFF03DAC6);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFF000000);
  static const Color bubbleLight = Color(0xFFE0E0E0);

  // Dark Theme Colors
  static const Color primaryDark = Color(0xFFBB86FC);
  static const Color accentDark = Color(0xFF03DAC6);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color textDark = Color(0xFFFFFFFF);
  static const Color bubbleDark = Color(0xFF333333);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    hintColor: AppColors.accentLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.textDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        .copyWith(secondary: AppColors.accentLight, background: AppColors.backgroundLight),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    hintColor: AppColors.accentDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.textDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        .copyWith(secondary: AppColors.accentDark, background: AppColors.backgroundDark),
  );
}
