//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';


class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {

  TextEditingController cname = new TextEditingController();
  TextEditingController cmobile = new TextEditingController();
  void addData(){


    var url = "https://vyasprakruti.000webhostapp.com/API/insert2.php";
    http.post(url,body: {

      "username": cname.text,
      "password": cmobile.text,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Data"),

      ),
      body: ListView(
        children: [
          TextField(
            controller: cname ,
            decoration: InputDecoration(hintText: "Enter Name",labelText: "Enter Name"),
          ),
          TextField(
            controller: cmobile,
            decoration: InputDecoration(hintText: "Enter Password",labelText: "Enter Password"),
          ),
          MaterialButton(

            child: Text("Add Data"),
            color:  Colors.red,
            onPressed: (){
              addData();
              Navigator.of(context).push(

                MaterialPageRoute(builder: (BuildContext context)=>Home()),
              );
            },
          ),
        ],
      ),
    );
  }
}
