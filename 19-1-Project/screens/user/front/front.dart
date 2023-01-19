//@dart=2.9


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../bottom_navigation/download/download.dart';
import '../bottom_navigation/home/home.dart';

class Front extends StatefulWidget{
  @override
  FrontPage createState() => FrontPage();
}

class FrontPage extends State<Front> {
 // SharedPreferences logindata;
  //SharedPreferences adminlogindata;
  //SharedPreferences uniquedata;

 /* @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    adminlogindata = await SharedPreferences.getInstance();
    uniquedata = await SharedPreferences.getInstance();
    logindata.setBool('login', false);
    adminlogindata.setBool('admin_login', true);
    uniquedata.setBool('unique_login', false);
  }*/

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Download(),
  ];

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('E wishes', style: TextStyle(color: kGold),),
        automaticallyImplyLeading: false,
        backgroundColor: kDarkBrown,
        actions: <Widget>[
        /*  IconButton(
            icon: Icon(
              Icons.logout,
              color: kGold,
            ),
            onPressed: () {
            *//*  logindata.setBool('login', true);
              adminlogindata.setBool('admin_login', false);
              uniquedata.setBool('unique_login', true);*//*
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),*/
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: kLightGold,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Download',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kGold,
        backgroundColor: kDarkBrown,
        unselectedItemColor: kTerracotta,
        onTap: _onItemTapped,
      ),
    );
  }
}