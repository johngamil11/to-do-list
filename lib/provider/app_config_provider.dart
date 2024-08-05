import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';

  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    } else
      (appLanguage = newLanguage);
    notifyListeners();
  }

  void changetheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    } else
      (appTheme = newTheme);
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
