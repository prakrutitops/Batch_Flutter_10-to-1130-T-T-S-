//@dart=2.9
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../admin/front/front.dart';
import '../../constants.dart';
import '../front/front.dart';
import '../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return SplashScreenPage();
  }
}

class SplashScreenPage extends State<SplashScreen>{

  SharedPreferences logindata;
  SharedPreferences adminlogindata;
  SharedPreferences uniquedata;

  bool newuser;
  bool newadmin;
  bool newunique;

  @override
  void initState()
  {
    checkConnection();
  }

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      check_if_already_login();
    }
    else if (connectivityResult == ConnectivityResult.wifi) {
      check_if_already_login();
    }
    else{
      _showConnectionDialog();
    }
  }

  void _showConnectionDialog() async
  {
    return showDialog<void>
      (
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog
          (
          backgroundColor: kGrey,
          title: Row(children: [Icon(Icons.error),Text("\tNetwork Error")],),
          content: Text('Please check your internet connection.',style: TextStyle(fontStyle: FontStyle.italic)),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: Text("Exit",style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);

    adminlogindata = await SharedPreferences.getInstance();
    newadmin = (adminlogindata.getBool('admin_login') ?? true);

    uniquedata = await SharedPreferences.getInstance();
    newunique = (uniquedata.getBool('unique_login') ?? true);

    if (newuser != false && newadmin != false && newunique != false) {
      logindata.setBool('login', false);
      adminlogindata.setBool('admin_login', false);
      uniquedata.setBool('unique_login', false);
      Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Onboarding())),
      );
    }
    else{
      if(newuser == false && newadmin == true){
        if(newunique == true){
          logindata.setBool('login', false);
          adminlogindata.setBool('admin_login', false);
          uniquedata.setBool('unique_login', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding()));
        }
        else{
          logindata.setBool('login', false);
          adminlogindata.setBool('admin_login', true);
          uniquedata.setBool('unique_login', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Front()));
        }
      }
      else if(newuser == true && newadmin == false){
        if(newunique == true){
          logindata.setBool('login', false);
          adminlogindata.setBool('admin_login', false);
          uniquedata.setBool('unique_login', false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding()));
        }
        else{
          logindata.setBool('login', true);
          adminlogindata.setBool('admin_login', false);
          uniquedata.setBool('unique_login', false);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminFront()));
        }
      }
      else{
        logindata.setBool('login', false);
        adminlogindata.setBool('admin_login', false);
        uniquedata.setBool('unique_login', false);
        Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Onboarding())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGold,
      body: Center(
        //child: Transform.rotate(
        //  angle: -pi / 5,
          child: Image(
            image: AssetImage('images/logo.png'),
           // height: MediaQuery.of(context).size.height - 360,
           // width: MediaQuery.of(context).size.width - 330,
            height: 100,
            width: 100,
          ),
        //),
      ),
    );
  }
}