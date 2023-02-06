import 'package:asigname/src/api/api_tasks.dart';
import 'package:flutter/material.dart';

import '../widgets/cards_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T a r e a s"),
      ),
      body: FutureBuilder(
        initialData: const [],
        future: taskAppi(),
        builder: ((context, AsyncSnapshot snapshot) {
          List tradeData = snapshot.data;
          return RefreshWidget(tradeData: tradeData);
          //   }
          // }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.popAndPushNamed(context, "AddTaskScreen");
        },
      ),
    );
  }
}
