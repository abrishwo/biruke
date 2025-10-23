import 'package:flutter/material.dart';
import 'package:dtpocketfm/utils/sharedpre.dart';

class ThemeProvider with ChangeNotifier {
  late bool _isDarkMode;
  late SharedPre sharedPre;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _isDarkMode = true; // Default to dark mode
    sharedPre = SharedPre();
    loadTheme();
  }

  Future<void> loadTheme() async {
    _isDarkMode = await sharedPre.readBool('isDarkMode') ?? true;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await sharedPre.saveBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }
}
