import 'package:flutter/cupertino.dart';

import '../shared_pref.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme = false;

  set darkTheme(bool value) {
    _darkTheme = false;
    darkThemePreference.setDarkTheme(false);
    notifyListeners();
  }
}
