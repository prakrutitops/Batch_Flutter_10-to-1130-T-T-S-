//@dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

import '../login/login.dart';
import '../login/widgets/custom_clippers/brown_top_clipper.dart';
import '../login/widgets/custom_clippers/gold_top_clipper.dart';
import '../login/widgets/custom_clippers/lightgold_top_clipper.dart';
import '../login/widgets/header.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<Register> {
  RegisterPage();

  //final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  var username = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  var mobilenumber = TextEditingController();
  var otp = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  var identifier = "User";

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = "";
  bool otpCodeVisible = true;
  var countryCode="+91";

  void verifyMobileNumber(){
    auth.verifyPhoneNumber(phoneNumber: "$countryCode "+mobilenumber.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        Fluttertoast.showToast(msg: "Please Wait Few Seconds",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
        await auth.signInWithCredential(credential).then((value){
          insertData();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
        });
      },
      verificationFailed: (FirebaseAuthException exception){
        Fluttertoast.showToast(msg: "Verification Is Failed Please Try Again Later",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
      },
      codeSent: (String verificationID, int resendToken){
        verificationIDReceived = verificationID;
        otpCodeVisible = false;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationID){},
    );
  }

  void _codeAutoRetrievalTimeout() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kGrey,
          title: Row(children: [Icon(Icons.error),Text("\tServer Error")],),
          content: Text('Please restart your application.',style: TextStyle(fontStyle: FontStyle.italic)),
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

  void verifyCode() async {
    Fluttertoast.showToast(msg: "Please Wait Few Seconds",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIDReceived, smsCode: otp.text);
    await auth.signInWithCredential(credential).then((value){
      insertData();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
    });
  }

  void insertData(){
    var url1 = "https://vyasprakruti.000webhostapp.com/FlutterProject/Register/register_insert.php";
    http.post(Uri.parse(url1),body: {
      "username": username.text,
      "password": password.text,
      "confirm_password": confirmpassword.text,
      "mobile_no": mobilenumber.text,
      "identifier": identifier,
    });

    var url2 = "https://karansavaliya.000webhostapp.com/Bubble/Profile/profile_insert.php";
    http.post(Uri.parse(url2),body: {
      "p_username": username.text,
      "p_mobile_no": mobilenumber.text,
    });
    Fluttertoast.showToast(msg: "Registration Successfully Completed",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
  }

  Future viewMobileNoData() async {
    var url = "https://vyasprakruti.000webhostapp.com/FlutterProject/Register/register_unique_mobileno_view.php";
    var response = await http.post(Uri.parse(url), body: {
      "mobile_no": mobilenumber.text,
    });

    var data = json.decode(response.body);

    if(data==0) {
      insertData();
      verifyMobileNumber();
    }
    else{
      final snackBar = SnackBar(
        content: Text('Mobile Number Has Already Been Registered',
          style: TextStyle(
            color: kLightGold,
          ),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: kDarkBrown,
      );
      _messangerKey.currentState.showSnackBar(snackBar);
      //_messangerKey.currentState.showSnackBar(new SnackBar(content: new Text("This is a message")));

      }
  }

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

                          Text('Register here if you do not have account in E-wishes',
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

                          SizedBox(height: space-6),

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

                          SizedBox(height: space-6),

                          TextField(
                            controller: confirmpassword,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                                onPressed: (){
                                  setState(() {
                                    _isObscureConfirmPassword = !_isObscureConfirmPassword;
                                  });
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                            obscureText: _isObscureConfirmPassword,
                          ),
                          SizedBox(height: space-6),
                          !otpCodeVisible ?
                          TextField(
                            controller: otp,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'OTP',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.code,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                          ) :
                          TextField(
                            controller: mobilenumber,
                            keyboardType: TextInputType.number,
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

                          SizedBox(height: space-8),

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
                              onPressed: (){
                                String  PasswordPattern = r'^(?=.*?[!@#\$&*~])';
                                RegExp regExp = new RegExp(PasswordPattern);

                                if(!otpCodeVisible){
                                  if(!otp.text.isEmpty) {
                                    if (otp.text.length!=6) {
                                      final snackBar = SnackBar(
                                        content: Text('Invalid OTP',
                                          style: TextStyle(
                                            color: kLightGold,
                                          ),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: kDarkBrown,
                                      );
                                      _messangerKey.currentState.showSnackBar(snackBar);
                                    }
                                    else{
                                      verifyCode();
                                    }
                                  }
                                  else{
                                    if (otp.text.isEmpty) {
                                      final snackBar = SnackBar(
                                        content: Text('Please Enter OTP',
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
                                }
                                //else{
                                  if (username.text.isNotEmpty && password.text.isNotEmpty && confirmpassword.text.isNotEmpty && mobilenumber.text.isNotEmpty) {
                                    if(!regExp.hasMatch(password.text)){
                                      final snackBar = SnackBar(
                                        content: Text('Must Contain Special Character Either . * @ # \$',
                                          style: TextStyle(
                                            color: kLightGold,
                                          ),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: kDarkBrown,
                                      );
                                      _messangerKey.currentState.showSnackBar(snackBar);
                                    }
                                    else if(password.text!=confirmpassword.text){
                                      final snackBar = SnackBar(
                                        content: Text('Password Does Not Match',
                                          style: TextStyle(
                                            color: kLightGold,
                                          ),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: kDarkBrown,
                                      );
                                      _messangerKey.currentState.showSnackBar(snackBar);
                                    }
                                    else if(mobilenumber.text.length!=10){
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
                                    else{
                                      Timer(Duration(seconds: 60), ()=>_codeAutoRetrievalTimeout());
                                      viewMobileNoData();
                                    }
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
                                    else if(confirmpassword.text.isEmpty){
                                      final snackBar = SnackBar(
                                        content: Text('Please Enter Confirm Password',
                                          style: TextStyle(
                                            color: kLightGold,
                                          ),
                                        ),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: kDarkBrown,
                                      );
                                      _messangerKey.currentState.showSnackBar(snackBar);
                                    }
                                    else if(mobilenumber.text.isEmpty){
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
                                  }
                                },
                              //},
                              child: Text("Register an E-wishes Account",
                                style: Theme.of(context).textTheme.subtitle1.copyWith(color: kGold, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          SizedBox(height: space-8),
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
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                              },
                              child: Text("Already Have an Account? Login",
                                style: Theme.of(context).textTheme.subtitle1.copyWith(color: kDarkBrown, fontWeight: FontWeight.bold,),
                              ),
                            ),
                          ),
                          SizedBox(height: space-8),
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