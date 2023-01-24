//@dart=2.9
import 'dart:convert';
import 'package:amishaproject/screens/user/forgot_password/forgot_password.dart';
import 'package:amishaproject/screens/user/front/front.dart';
import 'package:amishaproject/screens/user/login/widgets/custom_clippers/brown_top_clipper.dart';
import 'package:amishaproject/screens/user/login/widgets/custom_clippers/gold_top_clipper.dart';
import 'package:amishaproject/screens/user/login/widgets/custom_clippers/lightgold_top_clipper.dart';
import 'package:amishaproject/screens/user/login/widgets/header.dart';
import 'package:amishaproject/screens/user/register/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../admin/front/front.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  LoginPage();

  SharedPreferences logindata_mobile;
  var sessionData;

  var identifier_data;

  //final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  var username = TextEditingController();
  var password = TextEditingController();
  var mobileno = TextEditingController();

  bool _isObscurePassword = true;

  Future<bool> commit() async {
    logindata_mobile ??= await SharedPreferences.getInstance();
    await logindata_mobile.setString("number", sessionData);
  }

  Future<List> viewSessionData() async{
    final responce = await http.get("https://amisha1299.000webhostapp.com/Ewishes/Register/register_session_view.php?data="+mobileno.text.toString());
    var _sessionData = jsonDecode(responce.body);

    sessionData = _sessionData[0]['id'];
    commit();
  }

  Future viewIdentifierData() async {
    var url = "https://amisha1299.000webhostapp.com/Ewishes/Register/register_identifier_view.php";
    var identifier_response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
      "mobile_no": mobileno.text,
    });

    identifier_data = json.decode(identifier_response.body);
  }

  Future login() async {
    var url = "https://amisha1299.000webhostapp.com/Ewishes/Register/register_view.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username.text.toString(),
      "password": password.text.toString(),
      "mobile_no":mobileno.text.toString()
    });
    var data = json.decode(response.body);


    if(data==0) {
      final snackBar = SnackBar(
        content: Text('Something Is Wrong...',
          style: TextStyle(
            color: kLightGold ,
          ),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: kDarkBrown,
      );
      _messangerKey.currentState.showSnackBar(snackBar);
    }
    else {
      viewSessionData();
      viewIdentifierData();
      if(identifier_data[0]['identifier']=="User"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Front()));
      }
      else{
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminFront()));

      }
    }
   /* if(data==0)
    {
      print("fail");
    }
    else
    {
      print("success");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Front(),),);
    }*/

  }


/*  Future viewData() async {
    var url = "https://amisha1299.000webhostapp.com/Ewishes/Register/register_view.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username.text,
      "password": password.text,
      "mobile_no": mobileno.text,
    });

    var data = json.decode(response.body);

    if(data==0) {
      final snackBar = SnackBar(
        content: Text('Something Is Wrong...',
          style: TextStyle(
            color: kLightGold ,
          ),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: kDarkBrown,
      );
      _messangerKey.currentState.showSnackBar(snackBar);
    }
    else {
      viewSessionData();
      viewIdentifierData();
      if(identifier_data[0]['identifier']=="User"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Front()));
      }
      else{
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminFront()));
        print('Xyz');
      }
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(

        resizeToAvoidBottomInset: false,
        backgroundColor: kLightGold,
        body: Stack(
          children: [
            ClipPath(
              clipper: const GoldTopClipper(),
              child: Container(color: kGold),
            ),
            ClipPath(
              clipper: const BrownTopClipper(),
              child: Container(color: kBrown),
            ),
            ClipPath(
              clipper: const LightGoldTopClipper(),
              child: Container(color: kLightGold),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                child: Column(
                  children: [
                    Header(),
                    //Spacer(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: space * 7),

                          Text('Login here using your username and password.',
                            style: Theme.of(context).textTheme.subtitle2.copyWith(color: kDarkBrown.withOpacity(0.7)),
                          ),

                          SizedBox(height: space-5),

                          TextField(
                            controller: username,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                          ),

                          SizedBox(height: space-7),

                          TextField(
                            controller: password,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscurePassword ? Icons.visibility_off : Icons.visibility),
                                onPressed: (){
                                  setState(() {
                                    _isObscurePassword = !_isObscurePassword;
                                  });
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                            obscureText: _isObscurePassword,
                          ),

                          SizedBox(height: space-7),

                          TextField(
                            controller: mobileno,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                          ),

                          SizedBox(height: space-7),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kDarkBrown,
                                padding: const EdgeInsets.all(kPaddingS+5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: ()
                              {
                                if (!username.text.isEmpty && !password.text.isEmpty && !mobileno.text.isEmpty && mobileno.text.length==10)
                                {
                                  login();
                                }
                                else{
                                  if(username.text.isEmpty){
                                    final snackBar = SnackBar(
                                      content: Text('Please Enter Username',
                                        style: TextStyle(
                                          color: kLightGold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: kDarkBrown,
                                    );
                                    _messangerKey.currentState.showSnackBar(snackBar);
                                  }
                                  else if(password.text.isEmpty){
                                    final snackBar = SnackBar(
                                      content: Text('Please Enter Password',
                                        style: TextStyle(
                                          color: kLightGold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: kDarkBrown,
                                    );
                                    _messangerKey.currentState.showSnackBar(snackBar);
                                  }
                                  else if(mobileno.text.isEmpty){
                                    final snackBar = SnackBar(
                                      content: Text('Please Enter Mobile Number',
                                        style: TextStyle(
                                          color: kLightGold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: kDarkBrown,
                                    );
                                    _messangerKey.currentState.showSnackBar(snackBar);
                                  }
                                  else if(mobileno.text.length!=10){
                                    final snackBar = SnackBar(
                                      content: Text('Invalid Mobile Number',
                                        style: TextStyle(
                                          color: kLightGold,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor: kDarkBrown,
                                    );
                                    _messangerKey.currentState.showSnackBar(snackBar);
                                  }
                                }
                              },
                              child: Text("Login to continue",
                                style: Theme.of(context).textTheme.subtitle1.copyWith(color: kGold, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          SizedBox(height: space),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kGold,
                                padding: const EdgeInsets.all(kPaddingS+5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                              },
                              child: Text("Forgot a E-wishes Password?",
                                style: Theme.of(context).textTheme.subtitle1.copyWith(color: kDarkBrown,fontSize:15 , fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          //SizedBox(height: 2 * space),

                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kBrown,
                                padding: const EdgeInsets.all(kPaddingS+5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
                              },
                              child: Text("Create an E-wishes Account",
                                style: Theme.of(context).textTheme.subtitle1.copyWith(color: kLightGold, fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                         // SizedBox(height: space),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}