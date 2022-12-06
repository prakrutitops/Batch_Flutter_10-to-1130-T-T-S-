//@dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddStudentPage extends StatefulWidget
{
  AddStudentPage({Key key}) : super(key: key);

  @override
  _AddStudentPageState createState() => _AddStudentPageState();

}

class _AddStudentPageState extends State<AddStudentPage>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var email = "";
  var password = "";

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
      return Scaffold(

        appBar: AppBar(
          title: Text("Add New Student"),
        ),
        body:Form(
          key: _formKey,
      child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    child: ListView(
    children: [

      Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            labelText: 'Name: ',
            labelStyle: TextStyle(fontSize: 20.0),
            border: OutlineInputBorder(),
            errorStyle:
            TextStyle(color: Colors.redAccent, fontSize: 15),
          ),
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Name';
            }
            return null;
          },
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
            labelText: 'Email: ',
            labelStyle: TextStyle(fontSize: 20.0),
            border: OutlineInputBorder(),
            errorStyle:
            TextStyle(color: Colors.redAccent, fontSize: 15),
          ),
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Email';
            } else if (!value.contains('@')) {
              return 'Please Enter Valid Email';
            }
            return null;
          },
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: TextFormField(
          autofocus: false,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password: ',
            labelStyle: TextStyle(fontSize: 20.0),
            border: OutlineInputBorder(),
            errorStyle:
            TextStyle(color: Colors.redAccent, fontSize: 15),
          ),
          controller: passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Password';
            }
            return null;
          },
        ),
      ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              name = nameController.text;
                              email = emailController.text;
                              password = passwordController.text;
                              addUser();
                              clearText();
                            });
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {clearText()},
                        child: Text(
                          'Reset',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      ),
                    ],
                ),
            )
    ],
    ),
      ),
        ),
      );
  }
  CollectionReference students = FirebaseFirestore.instance.collection('students');

  Future<void>addUser()
  {
    return students
       .add({'name': name, 'email': email, 'password': password})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));



  }

  void clearText() {

    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }
}
