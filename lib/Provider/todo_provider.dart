// providers/task_provider.dart
import 'package:flutter/material.dart';
import 'package:to_do_application/Model/model.dart';
import 'package:uuid/uuid.dart';


class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title, String discription, DateTime date,) {
    final newTask = Task(id: Uuid().v4(), title: title, description: discription, date: date);
    _tasks.add(newTask);
    notifyListeners();
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
