import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create:(context)=>TaskData(),
    child: MaterialApp(
      home:TodoApp(),
    ),
  ));
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.deepOrange,
        title: Text("ToDo"),
      ),
      body: ListView.builder(
          itemCount: context.watch<TaskData>().listTask.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("${context.watch<TaskData>().listTask[index].title}"),
              trailing: Checkbox(
                value:context.watch<TaskData>().listTask[index].isDone,
                onChanged: (value){
                  context.read<TaskData>().toggle(index, value);
                },
              ),
            );
          }),
    );
  }
}


class Task{
  String? title;
  bool? isDone;
  Task({this.title,this.isDone});
}

class TaskData extends ChangeNotifier{
  List<Task> listTask=[
    Task(title: 'buy milk',isDone:false),
  ];

  toggle(int index,bool? value){
    listTask[index].isDone=value;
    notifyListeners();
  }
}
