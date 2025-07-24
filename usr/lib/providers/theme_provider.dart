import 'package:flutter/material.dart';
import 'package:couldai_user_app/utils/app_constants.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeData get currentTheme {
    if (_themeMode == ThemeMode.system) {
      // In a real app, you would get the system brightness here.
      // For now, we default to light if system is chosen.
      return AppTheme.lightTheme;
    } else if (_themeMode == ThemeMode.dark) {
      return AppTheme.darkTheme;
    } else {
      return AppTheme.lightTheme;
    }
  }
}
