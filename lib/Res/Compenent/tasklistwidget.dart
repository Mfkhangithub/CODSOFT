// widgets/task_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/Data/tasktitle.dart';
import 'package:to_do_application/Provider/todo_provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: tasks[index]);
      },
    );
  }
}
