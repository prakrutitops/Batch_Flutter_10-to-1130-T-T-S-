//@dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

          home: MyApp2(),

      );
  }

}

class MyApp2  extends StatefulWidget
{
  @override
  _MyApp2State createState() =>  _MyApp2State();


}

class _MyApp2State extends State<MyApp2> {

  final _formKey = GlobalKey<FormState>();

  String name, email, password;

  bool isLoading = false;

  GlobalKey<ScaffoldState>_scaffoldKey = GlobalKey();

  ScaffoldMessengerState scaffoldMessenger;

  //Email Validation
  var reg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(

          child: Container
            (
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: Stack(

              children: <Widget>[

                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    "assets/a.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                            "assets/logo1.png",
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                          )
                      ),
                      SizedBox(
                        height: 13,
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: _nameController,

                                decoration: InputDecoration(

                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  name = val;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: _emailController,

                                decoration: InputDecoration(

                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  email = val;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white)),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  password = val;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 0),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        if (isLoading)
                                        {
                                          return;
                                        }
                                        if (_nameController.text.isEmpty)
                                        {
                                          scaffoldMessenger.showSnackBar(
                                              SnackBar(content: Text(
                                                  "Please Enter Name")));
                                          return;
                                        }
                                        if (!reg.hasMatch(
                                            _emailController.text)) {
                                          scaffoldMessenger.showSnackBar(
                                              SnackBar(content: Text(
                                                  "Enter Valid Email")));
                                          return;
                                        }
                                        if (_passwordController.text.isEmpty ||
                                            _passwordController.text.length <
                                                6) {
                                          scaffoldMessenger.showSnackBar(
                                              SnackBar(content: Text(
                                                  "Password should be min 6 characters")));
                                          return;
                                        }
                                        signup
                                          (
                                            _nameController.text,
                                            _emailController.text,
                                            _passwordController.text

                                          );
                                      },

                                    ),
                                  ),
                                  Positioned(
                                    child: (isLoading)
                                        ? Center(child: Container(height: 26,
                                        width: 26,
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.green,)))
                                        : Container(),
                                    right: 30,
                                    bottom: 0,
                                    top: 0,)

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void signup(String name, String email, String password) async
  {

    setState(()
    {
      isLoading=true;
    });

    Map data =
    {
      'username': name,
      'email': email,
      'password': password
    };

    print(data.toString());

    final  response= await http.post
      (
        Uri.parse("https://vyasprakruti.000webhostapp.com/API/insert2.php"),
        headers:
        {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },


        body: data,
        encoding: Encoding.getByName("utf-8")
    )  ;


    if (response.statusCode == 200)
    {

      setState(()
      {
        isLoading=false;
      });
      Map<String,dynamic>resposne=jsonDecode(response.body);
      if(!resposne['error'])
      {
        Map<String,dynamic>user=resposne['data'];
        print(" User name ${user['data']}");


      }
      else
      {
        print(" ${resposne['message']}");
      }
      scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne['message']}")));

    }
    else
    {
      scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Try again")));
    }



  }
}


