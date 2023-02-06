import 'package:asigname/src/providers/task.dart';
import 'package:asigname/src/theme/app_theme.dart';
import 'package:asigname/src/widgets/color_lineal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final List _iSChecked = [];
  final List _taskComplete = [];

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
    final providerData = Provider.of<Task>(context);
    return RefreshIndicator(
        child: ListView.separated(
            separatorBuilder: ((context, index) => Divider()),
            itemBuilder: ((context, index) {
              _iSChecked.add([
                widget.tradeData[index]["id"],
                widget.tradeData[index]["is_completed"]
              ]);
              print(_iSChecked);
              return Card(
                child: Column(
                  children: [
                    colorLinear(
                      ListTile(
                        title: Text(
                          widget.tradeData[index]["title"],
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Checkbox(
                            activeColor: AppTheme.primary,
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
                          // providerData.setCompleted =
                          // _taskComplete.add(taskAppiId(widget.tradeData[index]["id"]));
                          // providerData.isCompleted = _taskComplete[0];
                          providerData.setCompleted = widget.tradeData[index];
                          print(providerData.getCompleted);
                          // print(providerData.getCompleted);
                          Navigator.popAndPushNamed(context, "TaskScreen");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.date_range_outlined,
                            color: Color(0xFF1A648D),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(widget.tradeData[index]["due_date"]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
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
