//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/page.dart';
import 'package:untitled9/pagebuild.dart';
import 'package:untitled9/pagecustom.dart';



class HomePage extends StatefulWidget
{
  @override
  _HomepageState createState() =>  _HomepageState();

}

class _HomepageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
        appBar: AppBar
          (
            title: Text('PageView - Flutter'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Center(

        child: Padding(
        padding: const EdgeInsets.all(10),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: ()
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageViewTest1()));
          },
          child: Text
            (
            'PageView Example',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.amber[800],
        ),
      ),

      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: ()
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageViewBuild()));
          },
          child: Text
            (
            'PageView Example',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.amber[800],
        ),
      ),

      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: ()
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageViewCustom()));
          },
          child: Text
            (
            'PageView Example',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.amber[800],
        ),
      ),





              ]
              ),
            ),
            )

    );
  }

}