import 'package:flutter/material.dart';

class Myprovider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment(int count) {
    _count++;
    print(_count);
    notifyListeners();
  }

  String _data = "Initial Data";

  String get data => _data;

  updateData() {
    _count++;
    notifyListeners();
  }
}
