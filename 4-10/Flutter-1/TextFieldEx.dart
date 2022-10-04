import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextFieldEx extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(

      home:MyState()


    );
  }

}

class MyState extends StatefulWidget
{
  @override
  _State createState() => _State();
}
class _State extends State<MyState>
{
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(

      appBar: AppBar
        (
          title: Text('Flutter TextField Example'),
        ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            children: <Widget>[

        Padding(
        padding: EdgeInsets.all(15),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
              hintText: 'Enter Your Name',
            ),
          ),)
           ,

              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                  ),
                ),
              ),
            TextButton(
              child: Text('Sign In'),
              onPressed: (){}
            ),
            ]
        )
      )
    );

  }

}