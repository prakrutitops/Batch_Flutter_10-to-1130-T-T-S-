//@dart=2.9
import 'package:flutter/material.dart';
import 'package:project2/Data/SliderEx.dart';
import 'package:project2/FirstScreen.dart';



void main()
{
  runApp(MaterialApp(
    title: 'Slider Example',
    theme: ThemeData
      (
      // This is the theme of your application.
      primarySwatch: Colors.green,
      ),
    home: Slider12(),
  ));
}


/*
void main()
{
  runApp(
      MaterialApp(
        title: 'Named Route Navigation',
        theme: ThemeData
          (
      // This is the theme of your application.
            primarySwatch: Colors.green,
          ),
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
       initialRoute: '/',
       routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomeScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Click Here'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: TextButton(

          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}


*/
