// models/task.dart

import 'package:hive/hive.dart';
part 'model.g.dart';
@HiveType(typeId: 0)
class Task extends HiveObject{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime date;


  Task({required this.id, required this.title, required this.description, required this.date,});
}
