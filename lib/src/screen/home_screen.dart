import 'package:asigname/src/api/api_tasks.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = taskAppi();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        initialData: [],
        future: taskAppi(),
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Waiting for connection');
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              print('There is no data');
              return const Center(child: CircularProgressIndicator());
            } else {
              List tradeData = snapshot.data;
              return RefreshIndicator(
                  // child: const Text('WELCOME LIST'),
                  child: ListView.separated(
                      itemBuilder: ((context, index) => Card(
                            child: Column(
                              children: [
                                ListTile(
                                  leading:
                                      const Icon(Icons.water_drop_outlined),
                                  title:
                                      Text(tradeData[index]["title"]),
                                  trailing:
                                      const Icon(Icons.check_box_outline_blank),
                                  onTap: () {
                                    print(data);
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
                      separatorBuilder: ((context, index) => const Divider()),
                      itemCount: tradeData.length),
                  onRefresh: () async {});
            }
          }
        }),
      ),
      // body: ListView.separated(
      //     itemBuilder: ((context, index) => Card(
      //           child: Column(
      //             children: [
      //               ListTile(
      //                 leading: const Icon(Icons.water_drop_outlined),
      //                 title: const Text("Darle de comer al pecesito"),
      //                 trailing: const Icon(Icons.check_box_outline_blank),
      //                 onTap: () {
      //                   print(data);
      //                 },
      //               ),
      //               Row(
      //                 children: [
      //                   Container(
      //                     color: Colors.red,
      //                   ),
      //                   const Icon(
      //                     Icons.date_range_outlined,
      //                     color: Colors.red,
      //                   ),
      //                   const Text("14/Feb/2023")
      //                 ],
      //               )
      //             ],
      //           ),
      //         )),
      //     separatorBuilder: ((context, index) => Divider()),
      //     itemCount: 2),
    );
  }
}
