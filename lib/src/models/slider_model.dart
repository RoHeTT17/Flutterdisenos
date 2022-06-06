
import 'package:flutter/cupertino.dart';

//Clase para notificar el cambio del valor de la pagina

class SliderMoidel extends ChangeNotifier{

 double _currentPage = 0;

 double get getCurrentPage => this._currentPage;

 set setCurrentPage(double value) {
   this._currentPage = value;
    notifyListeners();
 } 


}