import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  late Map isCompleted;
  int _complete = 2;

  get getCompleted {
    return isCompleted;
  }

  set setCompleted(Map completed) {
    isCompleted = completed;
    notifyListeners();
  }

  get getCompletedInitial {
    return {
      "title": "Nueva tarea",
      "is_completed": 0,
      "due_date": "2023-02-06"
    };
  }

  get getTaskId {
    return _complete;
  }

  set setTaskId(int complete) {
    _complete = complete;
    notifyListeners();
  }
}
