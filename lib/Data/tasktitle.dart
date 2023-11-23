// widgets/task_tile.dart
import 'package:flutter/material.dart'; // Update this import line
import 'package:provider/provider.dart';
import 'package:to_do_application/Model/model.dart';
import 'package:to_do_application/Provider/todo_provider.dart';
import 'package:intl/intl.dart';
import 'package:to_do_application/Res/Compenent/colors.dart';




class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(task.title),
            subtitle: Text(DateFormat('yyyy-MM-dd – kk:mm').format(task.date)),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: AppColor.redcolor,),
              onPressed: () {
                Provider.of<TaskProvider>(context, listen: false)
                    .removeTask(task.id);
              },
            ),
          ),
          Divider(color: Colors.black, indent: 30,endIndent: 30,),
        ],
      ),
    );
  }
}
