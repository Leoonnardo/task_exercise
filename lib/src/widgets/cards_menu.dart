import 'package:flutter/material.dart';

import '../api/api_tasks.dart';

class RefreshWidget extends StatefulWidget {
  const RefreshWidget({
    Key? key,
    required this.tradeData,
  }) : super(key: key);

  final List tradeData;

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  List _iSChecked = [];

  bool completeBool(data) {
      if (data == 1) {
        return true;
      } else {
        return false;
      }
    }

    int completeInt(data) {
      if (data == 1) {
        return 0;
      } else {
        return 1;
      }
    }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.separated(
            itemBuilder: ((context, index) {
              _iSChecked.add([
                widget.tradeData[index]["id"],
                widget.tradeData[index]["is_completed"]
              ]);
              print(_iSChecked);
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.water_drop_outlined),
                      title:

                          Text(widget.tradeData[index]["title"]),
                      trailing:
                          Checkbox(
                        value: completeBool(_iSChecked[index][1]),
                        onChanged: ((value) {
                          _iSChecked[index][1] =
                              completeInt(_iSChecked[index][1]);
                          putTaskAppi(
                              widget.tradeData[index]["id"].toString(),
                              bodyCompleted(
                                  _iSChecked[index][1],
                                  widget.tradeData[index]["title"],
                                  widget.tradeData[index]["due_date"]));
                          setState(() {});
                        })),
                      onTap: () {
                        // print(data);
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
                        Text(widget.tradeData[index]["due_date"])
                      ],
                    )
                  ],
                ),
              );
            }),
            separatorBuilder: ((context, index) => const Divider()),
            itemCount: widget.tradeData.length),
        onRefresh: () async {});
  }
  Map bodyCompleted(completed, title, date) {
    return {
      "token": "Leonardo",
      "title": title,
      "is_completed": completed,
      "due_date": date,
    };
  }
}