import 'package:flutter/material.dart';

class TextExample extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      title: "FirstApp",
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

      appBar: AppBar
        (
          title:Text("Text Widget Example234")
      ),
      body: Center(
        child: Text("Prakruti",
          style: TextStyle(
              fontSize: 35,
              color: Colors.purple,
              fontWeight:FontWeight.w700 ,
              fontStyle:FontStyle.italic,
              wordSpacing:20,
              letterSpacing:8,
              backgroundColor: Colors.yellow,
              shadows:
              [
                Shadow(color: Colors.blueAccent, offset: Offset(2,1), blurRadius:10)
              ]


          ),

        ),

      ),
    );
  }

}

