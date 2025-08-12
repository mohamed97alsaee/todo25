import 'package:flutter/widgets.dart';

class DarkModeProvider with ChangeNotifier {
  bool isDark = false;

  switchMode() {
    isDark = !isDark;
    notifyListeners();
  }
}
