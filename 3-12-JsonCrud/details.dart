//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'editdata.dart';
import 'main.dart';


class Details extends StatefulWidget
{

  List list;
  int index;


  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  void delete(){
    var url = "https://vyasprakruti.000webhostapp.com/API/delete2.php";
    http.post(url,body: {
      'id':widget.list[widget.index]['id'],

    });
  }

void confirm(){

  AlertDialog alertDialog = new AlertDialog(
    content: Text("Are You Sure?"),
    actions: [
      MaterialButton(
        child: Text("OK DELETE"),
        onPressed: (){
          delete();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Home()));
        },
      ),
      MaterialButton(
        child: Text("CANCEL"),
        onPressed: (){},
      ),

    ],
  );
   showDialog(builder: (context) => alertDialog, context: context);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('${widget.list[widget.index]['username']}'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
          widget.list[widget.index]['username'],
          style: TextStyle(fontSize: 20.0),
        ),
            Text(
              widget.list[widget.index]['password'],

            ),
            MaterialButton(
              child: Text("Edit"),
              color: Colors.deepPurpleAccent,

               onPressed: ()=>Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> Edit(list:widget.list,index:widget.index)),
              ),
            ),
            MaterialButton(
              child: Text("Delete"),
              color: Colors.deepPurpleAccent,
              onPressed: (){
                confirm();
              }
            )
          ],
        ),
      ),
    );
  }
}
