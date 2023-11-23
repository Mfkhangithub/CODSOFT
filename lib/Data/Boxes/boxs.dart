


import 'package:hive/hive.dart';

import '../../Model/model.dart';

class Boxes{
  static Box<Task> getData() => Hive.box<Task>('nodes');
}