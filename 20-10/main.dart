import 'package:flutter/material.dart';

import 'navigationdrawer.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(

      home: MyNaviagtionDrawer(),

    );
  }

}

class MyBottomNavigation extends StatefulWidget
{
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();


}

class _MyBottomNavigationState extends State<MyBottomNavigation>
{

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>
  [
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context)
  {
      return Scaffold(

          appBar: AppBar(
              title: Text("Bottom Navigation View"),
          ),
        body: Center
          (
          child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[

                BottomNavigationBarItem
                  (
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.green
                 ),

                BottomNavigationBarItem
                  (
                    icon: Icon(Icons.search),
                    label: 'Search',
                    backgroundColor: Colors.green
                ),

                BottomNavigationBarItem
                  (
                    icon: Icon(Icons.person),
                    label: 'Person',
                    backgroundColor: Colors.green
                ),


              ],

              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              iconSize: 40,
              onTap: _onItemTapped,
              elevation: 5
          ),

      );


  }


  void _onItemTapped(int value)
  {
      setState(() {

        _selectedIndex = value;

        if(_selectedIndex==1)
          {

          }
        if(_selectedIndex==2)
          {

          }


      });


  }
}

