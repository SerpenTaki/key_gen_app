import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int _count = 0;

  int get count => _count;

  void plusOne(){
    _count += 1;
    notifyListeners();
  }

  void minusOne(){
    _count--;
    notifyListeners();
  }
}