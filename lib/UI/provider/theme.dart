


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  Themeprovider() {
    loadcurrenttheme();
  }
  bool _darktheme = false;
  get darktheme => _darktheme;
//  final SharedPreferences sharedPreferences;
  Future<void> toggletheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _darktheme = !_darktheme;

    preferences.setBool("theme", _darktheme);
    notifyListeners();
  }

  void loadcurrenttheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    _darktheme = preferences.getBool("theme") ?? false;
    notifyListeners();
  }
}
