import 'package:flutter/foundation.dart';

class CountModel extends ChangeNotifier {
  int _count = 1;

  int get count => _count;

  void decrementCounter() {
    _count--;
    notifyListeners();
  }

  void incrementCounter() {
    _count++;
    notifyListeners();
  }
}