//@dart=2.9
import 'package:flutter/material.dart';

//Model class
class Task
{
  final String task_name;
  final String description;

  Task(this.task_name, this.description);

}

class FirstScreen extends StatelessWidget
{
 final List<Task>task2;

 FirstScreen({Key key, @required this.task2}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
      return Scaffold(



        appBar: AppBar
          (
            title: Text('GeeksForGeeks'),
            backgroundColor: Colors.green,
          ),
          body: ListView.builder
            (
             itemCount: task2.length,
             itemBuilder: (context, index)
             {
                return ListTile
                  (
                      title: Text(task2[index].task_name),
                      onTap: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute
                        (
                            builder: (context) => SecondScreen(task: task2[index])
                        ));
                      },
                  );
          }
            )
      );
  }

}

class SecondScreen extends StatelessWidget
{
  final Task task;
  SecondScreen({Key key, @required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar
        (
          title: Text(task.task_name),
          backgroundColor: Colors.green,
        ),
      body: Padding
      (
        padding: EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );


  }

}