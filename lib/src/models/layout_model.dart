import 'package:flutter/material.dart';

import 'package:disenos/src/pages/slide_page.dart';

class LayoutModel with ChangeNotifier{

  Widget _currentPage = SlidePage();
  
  Widget get getCurrentPage => this._currentPage;

  set setCurrentPage(Widget value){
    this._currentPage = value;
    notifyListeners();
  } 

}