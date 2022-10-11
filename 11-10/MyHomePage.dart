//@dart=2.9
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'MyHomePage2.dart';

class MyHomePage extends StatefulWidget
{
  @override
  _MyHomepageState createState() =>  _MyHomepageState();
}

class _MyHomepageState extends State<MyHomePage>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage2())),);


  }
  @override
  Widget build(BuildContext context)
    {
      return Scaffold(


          appBar: AppBar(
              title: Text("Lottiee Animation"),
          ),

          body: Center(



          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Lottie.network(
                "https://vyasprakruti.000webhostapp.com/E-Greetings%20Project/animation.json",
                  height: 200.0,
                  repeat: true,
                  reverse: true,
                  animate: true
              )


            ],



          )

          ),

      );
    }

}
