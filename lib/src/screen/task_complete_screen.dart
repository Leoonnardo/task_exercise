import 'package:asigname/src/api/api_tasks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import '../widgets/button_widget.dart';

class TaskCompleteScreen extends StatefulWidget {
  const TaskCompleteScreen({super.key});

  @override
  State<TaskCompleteScreen> createState() => _TaskCompleteScreenState();
}

final title = TextEditingController();
final date = TextEditingController();

class _TaskCompleteScreenState extends State<TaskCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Task>(context);
    Map data = providerData.getCompleted;

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
                    buttonWidget("Guardar", Colors.green, () async {
                      providerData.setCompleted = data;
                      print("La data: $data");
                      await putTaskAppi(data["id"].toString(), {
                        "token": "Leonardo",
                        "title": data["title"],
                        "is_completed": data["is_completed"],
                        "due_date": data["due_date"]
                      });
                      Navigator.popAndPushNamed(context, "HomeScreen");
                    }),
                    buttonWidget("Cancelar", Colors.blue, (){
                      Navigator.popAndPushNamed(context, "HomeScreen");
                    })
                  ],
                ),
              ),
              buttonWidget("Eliminar tarea", Colors.red, () async {
                await deleteTaskAppi(
                          data["id"].toString(), {"token": "Leonardo"});
                Navigator.popAndPushNamed(context, "HomeScreen");
              })
            ],
          ),
        ));
  }
}
