//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget
{
  @override
  MyTest createState() => MyTest();

}
class MyTest extends State<Test>
{

  String data,finaldata;


  @override
  Widget build(BuildContext context)
  {

    return Scaffold
      (
            appBar: AppBar(),
        body: Padding
        (
        padding: const EdgeInsets.all(16.0),
        child: Form
        (
          child: Column(

              children: <Widget>[

                TextFormField(
                decoration: InputDecoration(labelText: 'Enter Data'),
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value)
                  {
                    //Validator
                    data = value;

                  },
                ),

                SizedBox
                  (
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                ElevatedButton
                  (

                  child: Text(
                    "Submit",
                    style: TextStyle
                      (
                      fontSize: 24.0,
                    ),
                  ),
                  onPressed: ()
                  {
                      finaldata =data;


                     /* Navigator.push(context,
                          MaterialPageRoute
                            (
                             // builder: (context) => Test2(finaldata);
                          ));
*/
                  },
                )


              ]




          ),

        )));

  }

}