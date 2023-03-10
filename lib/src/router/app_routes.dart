import 'package:asigname/src/screen/add_task_screen.dart';
import 'package:flutter/material.dart';

//las importaciones estan en el archivo screen/screen 
import '../screen/screen.dart';

class AppRoutes {
  static const initialRoute = "HomeScreen";

  static Map<String, Widget Function(BuildContext)> routes = {
    'HomeScreen': (BuildContext context) => const HomeScreen(),
    'TaskScreen': (BuildContext context) => const TaskCompleteScreen(),
    'AddTaskScreen': (BuildContext context) => const AddTaskScreen(),
  };
}
