import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastExample extends StatefulWidget
{
  @override
  _ToastExample1 createState() => _ToastExample1();

}

class _ToastExample1 extends State<ToastExample>
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(

      title: 'Toast Notification Example',
        home: Scaffold(
          appBar: AppBar
            (
              title: Text('Toast Notification Example'),
            ),
            body: Padding
              (
                padding: EdgeInsets.all(15.0),
              child: Center(
            child: TextButton
            (
            child: Text('click to show'),
            onPressed: showToast,
            ),
        ),
    ),
        )

    );
  }

  void showToast()
  {
      Fluttertoast.showToast
        (
        msg: "Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
      );
  }
}