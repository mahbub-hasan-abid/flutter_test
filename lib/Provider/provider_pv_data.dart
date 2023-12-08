import 'package:flutter/material.dart';

class data_pv extends ChangeNotifier {
  var value = 0;
  increment() {
    value++;
    notifyListeners();
  }

  updateScreen() {
    notifyListeners();
  }
}
