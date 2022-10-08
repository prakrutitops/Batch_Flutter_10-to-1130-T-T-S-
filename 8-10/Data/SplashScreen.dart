//@dart=2.9
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyApp.dart';

class MyApp2 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return MaterialApp(

          title: "Splash",
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          debugShowCheckedModeBanner: false,
        home: MyHomePage2()
      );
  }

}

class MyHomePage2 extends StatefulWidget
{
  @override
  _MyHomePage2State  createState()=> _MyHomePage2State();

}

class _MyHomePage2State extends State<MyHomePage2>
{

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                MyApp()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context)
  {
     return Container
      (
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }

}