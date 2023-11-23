// main.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/Model/model.dart';
import 'package:to_do_application/Provider/todo_provider.dart';
import 'package:to_do_application/View/add_task.dart';
import 'package:to_do_application/View/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('nodes');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-Do App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add_task': (context) => AddTaskScreen(),
          // '/edittask' : (context) => EditTask(),
        },
      ),
    );
  }
}
