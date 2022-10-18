import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        
        /*  appBar: AppBar(title: Text("First Screen"),),*/
            body: Center
              (
                  child: ElevatedButton(onPressed: () {  }, child: Text("First Button"),),
              ),
        
      );
  }
  
}