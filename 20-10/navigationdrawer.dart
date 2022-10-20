import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNaviagtionDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return MaterialApp(

        home: _MyNaviagtionDrawer1()

      );
  }



}

class _MyNaviagtionDrawer1 extends StatefulWidget
{
  @override
  _MyNaviagtionDrawer2  createState() => _MyNaviagtionDrawer2();

}

class _MyNaviagtionDrawer2 extends State<_MyNaviagtionDrawer1>
{
  @override
  Widget build(BuildContext context)
  {
        return Scaffold(

            appBar: AppBar(
                title: Text("Navigation Drawer"),
            ),
            drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>
                [
                  UserAccountsDrawerHeader(
                    accountName: Text("Abhishek Mishra"),
                    accountEmail: Text("abhishekm977@gmail.com"),
                    currentAccountPicture: CircleAvatar
                      (
                        backgroundColor: Colors.orange,
                        child: Text("A", style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  )

                ]
            )
            ),
        );
  }

}