import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {

  ViewState _state = ViewState.IDLE;

  ViewState get state => _state;

  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }
}

enum ViewState {
  IDLE, 
  BUSY
}