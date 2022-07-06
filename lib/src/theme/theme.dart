import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier{

  bool _darkTheme   = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;// = ThemeData.light();
  
  ThemeChanger(int theme){

      switch (theme){
        case 1: // light
                _darkTheme    = false;
                _customTheme  = false;
                _currentTheme = ThemeData.light().copyWith(
                                                            colorScheme: ColorScheme.dark().copyWith(
                                                                  secondary:  Colors.pink
                                                            ),
                                                        );
        break;
        case 2: //Dark
                _darkTheme    = true;
                _customTheme  = false;
                _currentTheme = ThemeData.dark();
        break;        
        case 3: //Personalizado
                _darkTheme    = false;
                _customTheme  = true;
              //  _currentTheme = ThemeData.dark();                
        break;
        default:
                _darkTheme    = false;
                _customTheme  = false;
                _currentTheme = ThemeData.light();
        break;        
      }
  }

  bool get getDarkTheme => this._darkTheme;

  set setDarkTheme(bool value){

    this._darkTheme = value;
    _customTheme = false;

    if(value){
      _currentTheme = ThemeData.dark().copyWith(
                                                colorScheme: ColorScheme.dark().copyWith(
                                                                  secondary:  Colors.pink),
                                               );
    }else{
      _currentTheme = ThemeData.light().copyWith(
                                                colorScheme: ColorScheme.dark().copyWith(
                                                                  secondary:  Colors.pink),
                                               );
    }

    notifyListeners();
  }

  bool get getCustomTheme => this._customTheme;

  set setCustomTheme(bool value) {
  
    this._customTheme = value;
    
    _darkTheme = false;

    if(value){
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark().copyWith(
          secondary:  const Color(0xff48A0EB)
        ),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const  Color(0xff16202B),
        textTheme: const TextTheme(
          bodyText1:  TextStyle (color: Colors.white)  
        )

      );

    }else{
      _currentTheme = ThemeData.light() ;
    }

    notifyListeners();
  }

  ThemeData get getCurrentTheme => this._currentTheme;

  /*
  *Se asignar valor por las decisiciones de los Switch  
  set setCurrentTheme(ThemeData value){ 
    this._currentTheme = value;
    notifyListeners();
  }*/

}