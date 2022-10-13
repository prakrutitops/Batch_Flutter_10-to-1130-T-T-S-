//@dart=2.9
import 'package:flutter/material.dart';
import 'package:untitled4/cafefile.dart';

void main()
{
  runApp(MyCafe());
}

class MyApp extends StatefulWidget
{
  @override
  _checkboxstate createState() => _checkboxstate();


}

class _checkboxstate extends State<MyApp>
{
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context)
  {
      return MaterialApp(

          home: Scaffold(
              appBar: AppBar
                (
                    title: Text("Checkbox Example"),
                ),
                body: Container(

                  padding: new EdgeInsets.all(22.0),
                  child: Column(

                    children: <Widget>[
                      SizedBox(width: 10,),
                       Text('Checkbox with Header and Subtitle',style: TextStyle(fontSize: 20.0), ),
                      CheckboxListTile
                        (
                          secondary: const Icon(Icons.alarm),
                          title: const Text('Ringing at 4:30 AM every day'),
                          subtitle: Text('Ringing after 12 hours'),
                          value: this.valuefirst,
                          onChanged: (bool value)
                          {
                              setState(() {

                                this.valuefirst = value;
                                print("MyCheckbox1 :"+valuefirst.toString());
                              });
                          }
                          ),

                      CheckboxListTile
                        (
                          controlAffinity: ListTileControlAffinity.trailing,
                          secondary: const Icon(Icons.account_circle),
                          title: const Text('Ringing at 4:30 AM every day'),
                          subtitle: Text('Ringing after 12 hours'),
                          value: this.valuesecond,
                          onChanged: (bool value)
                          {
                            setState(() {

                              this.valuesecond = value;
                              print("MyCheckbox2 :"+valuesecond.toString());
                            });
                          }
                      )

                    ]
                ),

                ),
          ),

      );
  }

}