//@dart=2.9
import 'package:data1/FirstScreen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return MaterialApp(

        title: 'FAB',
        theme: ThemeData
        (
          primarySwatch: Colors.blue,
        ),
        home: FirstScreen(task2:List.generate(20,(i) => Task(
          'Task $i',
          'Task Description $i',
        ),
        ),
        ),
        debugShowCheckedModeBanner: false,
      );

  }

}

class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>
{
  int i=0;



  @override
  Widget build(BuildContext context)
  {
      return Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Floating action button pressed this many times"),
              Text("$i",textScaleFactor: 3,)
            ],),
        ),



        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: ()
          {
            setState(() {

              i++;

            });
          },
        ),
      );


  }

}
