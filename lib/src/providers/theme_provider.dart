import 'package:appetit/src/preferences/preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  
  final prefs = AppPreferences();
  bool _darkTheme = false;

  // TRAER LOS DATOS ALMACENADOS
  void initTheme() async {
    final bool isDark = prefs.readPreferenceBool("darkMode");
    if (isDark == null || isDark == false) {
      _darkTheme = false;
    } else if (isDark == true) {
      _darkTheme = true;
    }
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    prefs.savePreferenceBool("darkMode", value);
    notifyListeners();
  }
}
