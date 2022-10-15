//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget
{
  @override
  _RadioState createState() => _RadioState();

}

class _RadioState extends State<RadioButton>
{
  @override
  Widget build(BuildContext context)
    {

          return MaterialApp(

            title: "My RadioButton",
            home: Scaffold(
              appBar: AppBar(

              ),
              body: Center
                (
                child: MyStatefulWidget(),
                ),

            ),

          );

    }

}
enum BestTutorSite { javatpoint,w3schools,tutorialandexample}

class MyStatefulWidget extends StatefulWidget
{
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
{
  BestTutorSite _site = BestTutorSite.javatpoint;

  @override
  Widget build(BuildContext context)
  {
      return Column(

          children: <Widget>[

            ListTile(
              title: const Text('www.javatpoint.com'),
              leading: Radio(
                value: BestTutorSite.javatpoint,
                groupValue: _site,
                onChanged: (BestTutorSite value) {
                  setState(() {
                    _site = value;
                  });
                },
              ),
            ),

            ListTile(
              title: const Text('www.w3school.com'),
              leading: Radio(
                value: BestTutorSite.w3schools,
                groupValue: _site,
                onChanged: (BestTutorSite value) {
                  setState(() {
                    _site = value;
                  });
                },
              ),
            ),

            ListTile(
              title: const Text('www.tutorialandexample.com'),
              leading: Radio(
                value: BestTutorSite.tutorialandexample,
                groupValue: _site,
                onChanged: (BestTutorSite value) {
                  setState(() {
                    _site = value;

                  });
                },
              ),
            ),

          ]

      );
  }

}