//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddStudentPage.dart';

class HomePage extends StatefulWidget
{
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text('Flutter FireStore CRUD'),
        ElevatedButton(
        onPressed: () => {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => AddStudentPage(),
      ),
      )
      },
      child: Text('Add', style: TextStyle(fontSize: 20.0)),
      style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
      )
  ],
  ),
    )
    );
  }
}