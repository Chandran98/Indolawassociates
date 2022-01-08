import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: white,
    textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.white));

final light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    shadowColor: Color(0xffFBB13E),
    dividerColor: black,
    textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.black));

class Themenotifier extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences sharedPreferences;
  bool? darktheme;

  get _darktheme => darktheme;

  Themeprovider() {
    darktheme = true;
  }

  toggletheme() {
    darktheme = darktheme!;
    notifyListeners();
  }
}
