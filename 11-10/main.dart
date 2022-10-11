//@dart=2.9
import 'package:flutter/material.dart';

//Model
class Task
{
  final String task_name;
  final String task_description;

  Task(this.task_name,this.task_description);
}

void main()
{
  runApp( MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(

        title: "My List",
        home: Scaffold(

          appBar: AppBar
            (
             title: Text("My List"),
              backgroundColor: Colors.green,
            ),
              body: Container(
  margin: EdgeInsets.symmetric(vertical: 20.0),
  height: 550.0,
  child: ListView(
  scrollDirection: Axis.vertical,
  children: <Widget>[


                  Container(
                    height: 480.0,
                    width: 240.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/m1.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),


                  Container(
                    height: 480.0,
                    width: 240.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/m2.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),


                  Container(
                    height: 480.0,
                    width: 240.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'images/m3.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  ]



              )
        )

    )
    );

  }

}