import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/com.a410/TextExample.dart';

class AlertEx extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

      return MaterialApp(

        title: "AlertDialog Example",
          home: Scaffold(
          appBar: AppBar
          (

          ),

    body: MyAlert(),
    )
      );

  }

}

class MyAlert extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
    {
      return Padding
        (
          padding: const EdgeInsets.all(20.0),
          child: TextButton
            (
              child: Text('Show alert'),
              onPressed: ()
              {
                showAlertDialog(context);
              },
            ),
      );


    }

  void showAlertDialog(BuildContext context)
  {
    Widget okButton = TextButton
      (
        child: Text("OK"),
        onPressed: ()
        {
          Navigator.of(context).pop();
        },
    );

    AlertDialog alert = AlertDialog
      (
        title: Text("Simple Alert"),
        content: Text("This is an alert message."),
        actions:
        [
          okButton,
        ],
    );
    showDialog
      (
        context: context,
        builder: (BuildContext context)
        {
          return alert;
        },
    );
  }

}