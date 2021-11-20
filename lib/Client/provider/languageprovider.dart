import 'package:flutter/material.dart';

class Languagenotifier with ChangeNotifier{

  Locale _currentlocale =Locale("en");
  Locale get currentlocale => _currentlocale;

  void changelanguage(_locale){
    _currentlocale=Locale (_locale);
    notifyListeners();
  }
}