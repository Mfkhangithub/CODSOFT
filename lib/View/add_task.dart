// screens/add_task_screen.dart
import 'package:flutter/material.dart';
import 'package:to_do_application/Data/Boxes/boxs.dart';
import 'package:to_do_application/Model/model.dart';
import 'package:to_do_application/Res/Compenent/colors.dart';
import 'package:to_do_application/Res/Compenent/datapickerwidget.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  final idController = TextEditingController();
  final dateController = TextEditingController();
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    // titleController = TextEditingController();
    // desController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Task Title'),
              ),
              SizedBox(height: 20),
               TextFormField(
                controller: desController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 20),
              Text('Select Date:'),
              DatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                     
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.redcolor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
                    child: Text('Cancle', style: TextStyle(color: AppColor.whitecolor, fontSize: 20), ),
                  ),
                  SizedBox(width: 10,),
                  TextButton(
                  onPressed: () {
                    final data = Task(
                      id: idController.text, 
                      title: titleController.text, 
                      description: desController.text,
                      date: DateTime.now());

                      final box = Boxes.getData();
                      box.add(data);
                      data.save();
                      titleController.clear();
                      desController.clear();
                      idController.clear();
                      dateController.clear();
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColor.blackcolor),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  ),
                  child: Text('Add  ', style: TextStyle(color: AppColor.whitecolor, fontSize: 20), ),
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
