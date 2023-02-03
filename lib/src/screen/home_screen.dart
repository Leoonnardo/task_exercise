import 'package:asigname/src/api/api_tasks.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: ((context, index) => Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.water_drop_outlined),
                      title: const Text("Darle de comer al pecesito"),
                      trailing: const Icon(Icons.check_box_outline_blank),
                      onTap: () {
                        taskAppi();
                      },
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.red,
                        ),
                        const Icon(
                          Icons.date_range_outlined,
                          color: Colors.red,
                        ),
                        const Text("14/Feb/2023")
                      ],
                    )
                  ],
                ),
              )),
          separatorBuilder: ((context, index) => Divider()),
          itemCount: 2),
    );
  }
}
