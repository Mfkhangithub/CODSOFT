import 'package:flutter/material.dart';
import 'package:to_do_application/Res/Compenent/colors.dart';
import 'package:to_do_application/Res/Compenent/datapickerwidget.dart';
import 'package:to_do_application/Data/Boxes/boxs.dart';
import 'package:to_do_application/Model/model.dart';

class EditTask extends StatefulWidget {
  final Task task;

  EditTask({required this.task});

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late TextEditingController titleController;
  late TextEditingController desController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    desController = TextEditingController(text: widget.task.description);
    _selectedDate = widget.task.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.greenshcolor,
        centerTitle: true,
        title: Text('Edit Task'),
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
              // Your DatePicker widget implementation
              // Assuming it's a custom widget or part of your library
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
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColor.redcolor,
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColor.whitecolor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      // Update the task with new values
                      final updatedTask = Task(
                        id: widget.task.id,
                        title: titleController.text,
                        description: desController.text,
                        date: _selectedDate,
                      );

                      // Update the task in the Hive box
                      final box = Boxes.getData();
                      box.put(widget.task.key, updatedTask);

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColor.greenshcolor,
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: AppColor.whitecolor,
                        fontSize: 20,
                      ),
                    ),
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
