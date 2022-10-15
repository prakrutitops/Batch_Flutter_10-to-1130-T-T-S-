//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/LoginLogout.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDashboard(),
    );
  }
}
class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}
class _MyDashboardState extends State<MyDashboard> {
   SharedPreferences logindata;
   String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  //get
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Welcome To Codeplayon.com  $username',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            //Logout
            ElevatedButton(
              onPressed: () {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => MyApp12()));
              },
              child: Text('LogOut'),
            )
          ],
        ),
      ),
    );
  }
}