import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme){
    switch(theme){
      case 1: // ligth
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
      break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
      break;

      case 3: // custom theme
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.light();
      break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }
 
  set darkTheme(bool valor){
    _customTheme = false;
    _darkTheme = valor;
    if(valor){
      _currentTheme = ThemeData.dark();
    }else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

   set customTheme(bool valor){
    _customTheme = valor;
    _darkTheme = false;
    if(valor){
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xFF48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xFF16202B),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white)
        )
      );
    }else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}