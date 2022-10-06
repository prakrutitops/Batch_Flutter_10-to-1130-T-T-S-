import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/SecondScreen1.dart';

class FirstScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return MaterialApp(

          title: "Navigation and routing",
          theme: ThemeData
            (
              primarySwatch: Colors.green
            ),
            home: MyHomePage(),
      );
  }


}
class MyHomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
          appBar: AppBar(
              title: Text("First Screen"),
          ),
          body: Center
            (
              child: ElevatedButton(
                child: Text('Click Here'),
                style: ElevatedButton.styleFrom
                  (
                    primary: Colors.purple,
                   /* padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold)*/),
                onPressed: ()
                {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondScreen()));
                },
              ),
            ),
      );
  }

}
