import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

        return Scaffold(

          appBar: AppBar
            (
              title: Text("Second Screen"),
            ),
          body: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom
                (
                 primary: Colors.purple,
                ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ),

    );

  }

}