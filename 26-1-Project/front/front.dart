//@dart=2.9

import 'package:amishaproject/screens/admin/bottom_navigation/home/home.dart';
import 'package:amishaproject/screens/admin/bottom_navigation/upload/upload.dart';
import 'package:amishaproject/screens/user/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class AdminFront extends StatefulWidget{
  @override
  AdminFrontPage createState() => AdminFrontPage();
}

class AdminFrontPage extends State<AdminFront> {
  SharedPreferences logindata;
  SharedPreferences adminlogindata;
  SharedPreferences uniquedata;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    adminlogindata = await SharedPreferences.getInstance();
    uniquedata = await SharedPreferences.getInstance();
    logindata.setBool('login', true);
    adminlogindata.setBool('admin_login', false);
    uniquedata.setBool('unique_login', false);
  }

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    AdminHome(),
    AdminUpload(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('E wishes',style: TextStyle(color: kGold),),
        automaticallyImplyLeading: false,
        backgroundColor: kDarkBrown,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: kGold,
            ),
            onPressed: () {
              logindata.setBool('login', false);
              adminlogindata.setBool('admin_login', true);
              uniquedata.setBool('unique_login', true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
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