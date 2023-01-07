//@dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';
import '../boarding/Onboarding.dart';

class SplashScreen extends StatefulWidget
{
  @override
  SplashState createState() => SplashState();

}

class SplashState extends State<SplashScreen>
{

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    checkConnection();
  }

  void checkConnection() async
  {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile)
    {
      check_if_already_login();
    }
    else if (connectivityResult == ConnectivityResult.wifi)
    {
      check_if_already_login();
    }
    else{
      _showConnectionDialog();
    }
  }
  void check_if_already_login()
  {
    Timer(Duration(seconds: 3), ()
    =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding())),
    );
  }
  void _showConnectionDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kGrey,
          title: Row(children: [Icon(Icons.error),Text("\tNetwork Error")],),
          content: Text('Please check your internet connection.',style: TextStyle(fontStyle: FontStyle.italic)),
          actions: <Widget>[
            ElevatedButton(
              onPressed: ()
              {
                SystemNavigator.pop();
              },
              child: Text("Exit",style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
        backgroundColor: kLightGold,
        body:Center
          (
            child: Image
              (
                image: AssetImage('images/logo.png'),
                height: MediaQuery.of(context).size.height - 360,
                width: MediaQuery.of(context).size.width - 330,
             )
          )

      );
  }

}
