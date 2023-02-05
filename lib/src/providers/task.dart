import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  String _theme = "light";
  List isCompleted = [];

  get getTheme {
    return _theme;
  }

  set setTheme(String theme) {
    _theme = theme;
    notifyListeners();
  }

  get getCompleted {
    return isCompleted;
  }

  set setCompleted(List completed) {
    isCompleted.add(completed);
    notifyListeners();
  }
}
