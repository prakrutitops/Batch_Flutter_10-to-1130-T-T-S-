//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainPage.dart';

class MyApp12 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return MaterialApp(
      title: "Form Validation",
      theme: ThemeData(
          brightness: Brightness.dark
      ),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage>
{
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  SharedPreferences logindata;
  bool newuser;
  String uname,pass;

  //first method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  //login skip
  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MyDashboard()));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar
        (

        title: Text("Form Validation"),
        leading: Icon(Icons.filter_vintage),
      ),
      body: Padding
        (
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:_formKey,
          child: Column(
              children: <Widget>[

                Text(
                  "Form-Validation In Flutter ",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value)
                  {
                    //Validator
                  },
                  validator: (value) {
                    uname = value;
                    if (value.isEmpty ||
                        !RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                  obscureText: true,
                  validator: (value) {
                    pass =value;
                    if (value.isEmpty) {
                      return 'Enter a valid password!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                ElevatedButton(

                  child: Text(
                    "Submit",
                    style: TextStyle
                      (
                      fontSize: 24.0,
                    ),
                  ),
                  onPressed: () => _submit(),
                )




              ]

          ),
        ),

      ),
    );
  }

  _submit()
  {

    final isValid = _formKey.currentState.validate();
    if (!isValid)
    {
      return;
    }
    else
    {
      _formKey.currentState.save();
      String username = uname;
      String password = pass;
      //prefrence value set
      if (username != '' && password != '')
      {
        print('Successfull');
        logindata.setBool('login', false);
        logindata.setString('username', username);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyDashboard()));
      }
    }

  }

}