import 'package:flutter/material.dart';
final lite = ThemeData(scaffoldBackgroundColor: Colors.lightGreenAccent);
final dip = ThemeData(scaffoldBackgroundColor: Colors.blueAccent);

class THemeprovider extends ChangeNotifier {
  

   bool _darktheme =true;

bool  get darktheme=>  _darktheme;

  // Themenotifier(){
  //   _darktheme=true;

  // }

  switchtheme(){
    _darktheme=!_darktheme;
    notifyListeners();
  }
}
