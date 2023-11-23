import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_application/Data/Boxes/boxs.dart';
import 'package:to_do_application/Model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_application/Res/Compenent/colors.dart';
import 'package:to_do_application/View/edittask.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text('To-Do App', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
      ),
      body: ValueListenableBuilder<Box<Task>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          var data = box.values.toList().cast<Task>();
          return ListView.builder(
      itemCount: box.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                      Text(data[index].title.toString(), 
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Spacer(),
                 InkWell(
                  onTap: (){
                    delete(data[index]);
                  },
                  child: Icon(Icons.delete, color: AppColor.redcolor,)),
                SizedBox(width: 15,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>EditTask(task: data[index]),
                        )
                        );

                  },
                  child: Icon(Icons.edit, color: AppColor.greenshcolor,)),
                  ],
                ),
                Text(data[index].description.toString(),
                style: TextStyle(fontSize: 18,),),
                Text(data[index].date.toString()),
              ],
            ),
          ),
        );
      },
    );

      }),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.brown,
        hoverColor: Colors.black,
        splashColor: Colors.black,
        
        backgroundColor: const Color.fromARGB(255, 80, 65, 60),
        onPressed: () async{
          // ignore: unused_local_variable
          // var box = await Hive.openBox("/add_task");
          Navigator.pushNamed(context, '/add_task');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void delete(Task task)async{
    await task.delete();
  }
}
