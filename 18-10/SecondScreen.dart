import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center
        (
        child: ElevatedButton(onPressed: () {  }, child: Text("Second Button"),),
      ),

    );
  }

}