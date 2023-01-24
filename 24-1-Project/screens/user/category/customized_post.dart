//@dart=2.9
import 'package:flutter/material.dart';
import '../../constants.dart';

class Customized extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CustomizedPage();
  }
}

class CustomizedPage extends State<Customized> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Post'.toUpperCase(),style: TextStyle(fontStyle: FontStyle.italic)),
        backgroundColor: kGold,
      ),
      body: Center(
        child: Text("Coming Soon ...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic,color: kBrown)),
      ),
    );
  }
}