//@dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
  runApp(
      MaterialApp(
          home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget
{
  @override
  MyAppState  createState() => MyAppState();

}

class MyAppState extends State<MyApp>
{
  List data;

  Future<String>getdata() async
  {
      var response = await http.get(Uri.encodeFull("https://vyasprakruti.000webhostapp.com/API/view2.php"),
          headers:
          {
            "Accept": "application/json"
          }

      );

      this.setState(() {

          data = json.decode(response.body);

      });

      print(data[1]["username"]);
      print(data[2]["password"]);


      return "Success!";


  }

 @override
  void initState()
  {
    super.initState();
    this.getdata();
  }

  @override
  Widget build(BuildContext context)
  {

      return Scaffold(

          appBar: AppBar(
              title: Text("My Details"),
          ),
          body:

               ListView.builder
                 (

                   itemCount: data == null ? 0 : data.length,
                   itemBuilder: (BuildContext context, int index)
                   {
                     return Card(
                       elevation: 5,
                       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                       child: Container(
                         padding: EdgeInsets.all(8),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [

                             Expanded(
                                 child: Container(
                                   padding: EdgeInsets.only(bottom: 8),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding: EdgeInsets.only(left: 8, right: 8),
                                         child: Text(
                                           data[index]["username"],
                                           style: TextStyle(
                                               fontSize: 16,
                                               fontWeight: FontWeight.bold),
                                         ),
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(left: 8, right: 8),
                                         child: Text(data[index]["password"]),
                                       )
                                     ],
                                   ),
                                 ))
                           ],
                         ),
                       ),
                     );
                   }
               )


      );

  }

}
