 import 'package:flutter/cupertino.dart';

class SliderProvider extends ChangeNotifier{
  /// here we are creating the _value variable and assign the 0.0 value
  double _value=0.0;
  /// created the getter
  get value=>_value;
/// this method updates the _value with  newvalue and notifyListeners to its listener
  void setslidervalue(double newvalue){

    _value=newvalue;
    notifyListeners();
  }




}