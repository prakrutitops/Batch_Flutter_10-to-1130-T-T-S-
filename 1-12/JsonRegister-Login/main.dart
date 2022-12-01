//@dart=2.9
import 'package:flutter/material.dart';
import 'package:jsonregisterlogin/screens/home.dart';
import 'package:jsonregisterlogin/screens/signin.dart';
import 'package:jsonregisterlogin/screens/signup.dart';




void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getPref();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
        ),
        (_loginStatus==1)?Home():LoginPage()
      ],),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signin': (BuildContext context) => new LoginPage(),
        '/signup': (BuildContext context) => new SignUp(),
        '/home': (BuildContext context) => new Home(),
      },
    );
  }
var _loginStatus=0;
/*  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _loginStatus = preferences.getInt("value");


    });
  }*/
}

