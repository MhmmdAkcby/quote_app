import 'package:flutter/material.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLightTheme = false;
  void chnageTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? ThemeData.dark() : ThemeData.light();
}
