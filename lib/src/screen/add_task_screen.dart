import 'package:asigname/src/api/api_tasks.dart';
import 'package:asigname/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import '../widgets/button_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

final title = TextEditingController();
final date = TextEditingController();

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Task>(context);
    Map data = providerData.getCompletedInitial;
    title.text = data["title"];
    date.text = data["due_date"];


    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: TextField(
                  controller: title,

                  // decoration: InputDecoration(border: OutlineInputBorder()),
                  maxLines: 1,
                  onChanged: ((value) {
                    data["title"] = value;
                    // print(data);
                  }),
                ),
                subtitle: TextField(
                  controller: date,
                  // decoration: InputDecoration(border: OutlineInputBorder()),
                  maxLines: 1,
                  onChanged: ((value) {
                    data["due_date"] = value;
                  }),
                ),
                trailing: const Icon(Icons.date_range_outlined),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.list_alt_outlined),
                title: Text("Descripción (fuera de servicio)"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  maxLines: 20,
                  enabled: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonWidget("Guardar", AppTheme.primary, () async {
                      providerData.setCompleted = data;
                      // print("La data: $data");
                      await addTaskAppi({
                        "token": "Leonardo",
                        "title": data["title"],
                        "is_completed": data["is_completed"],
                        "due_date": data["due_date"]
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.popAndPushNamed(context, "HomeScreen");
                    }),
                    buttonWidget("Cancelar", AppTheme.secundary, () {
                      Navigator.popAndPushNamed(context, "HomeScreen");
                    })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
