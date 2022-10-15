//@dart=2.9
import 'package:flutter/material.dart';
import 'package:untitled6/radioex.dart';
import 'LoginLogout.dart';
import 'Person.dart';
import 'dart:ui';

void main()
{
  runApp(MyApp12());
}

class MyApp extends StatefulWidget
{
  @override
  _MyGridState createState() =>  _MyGridState();
}

class _MyGridState extends State<MyApp>
{

  List<Person>peoplelist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    peoplelist =
    [
      Person(id:"1", name:"Poonam", address:"Kathmandu, Nepal"),
      Person(id:"2", name:"Krishna", address:"Lumbini, Nepal"),
      Person(id:"3", name:"Anil", address:"Chaumala, Nepal"),
      Person(id:"4", name:"Arjun", address:"Kailali, Nepal"),
      Person(id:"5", name:"Karan", address:"Dhangadhu, Nepal"),
      Person(id:"6", name:"Saroj", address:"Pokhara, Nepal"),
      Person(id:"1", name:"Poonam", address:"Kathmandu, Nepal"),
      Person(id:"2", name:"Krishna", address:"Lumbini, Nepal"),
      Person(id:"3", name:"Anil", address:"Chaumala, Nepal"),
      Person(id:"4", name:"Arjun", address:"Kailali, Nepal"),
      Person(id:"5", name:"Karan", address:"Dhangadhu, Nepal"),
      Person(id:"6", name:"Saroj", address:"Pokhara, Nepal"),
    ];
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(

        title: "Custom List",
        theme: ThemeData
          (

              brightness: Brightness.dark,

          ),
        home: Scaffold(

          appBar: AppBar
            (
                title:Text("GridView People List"),
                backgroundColor: Colors.redAccent
            ),
            body:GridView.count
              (
                crossAxisCount: 2,
                shrinkWrap: true,
                children: peoplelist.map((people){
                  return Card(
                      elevation: 10,
                      margin: EdgeInsets.all(8),
                      child:Container(
                        color: Colors.orange[100],
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, //main axix alignemnt to center
                  children: <Widget>
                  [
                    Text(people.name, style: TextStyle(fontSize:20)),
                    Text(people.address, style: TextStyle(fontSize:13)),
                  Container(
                  margin: EdgeInsets.only(top:20),
                  child:ElevatedButton.icon(
                  onPressed: (){
                  print('Clicked on view details: ' + people.id);
                  //add more action for this button
                  //Navigator.push() to show details in new page
                  },
                  icon: Icon(Icons.person),
                  label: Text("View Details"),

                    style: ElevatedButton.styleFrom
                      (

                        primary: Colors.redAccent,

                      ),


                  //color brightness is dark becaause its background is dark color
                  )
                  ),

                  Container(
                  margin: EdgeInsets.only(top:0),
                  child:ElevatedButton.icon(
                  onPressed: (){
                  print('Clicked on send email: ' + people.id);
                  //add more action for this button
                  //Navigator.push() to show details in new page
                  },
                  icon: Icon(Icons.mail),
                  label: Text("Send Email"),
                    style: ElevatedButton.styleFrom
                      (

                      primary: Colors.blueAccent,

                    ),

                  //color brightness is dark becaause its background is dark color
                  )
                  )
                  ],
       )
        ));
           }).toList(),
  )
  ));
  }
}









