//@dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seekbar/seekbar.dart';

void main()
{
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();



}
class _MyAppState extends State<MyApp>
{
  double _value = 0.0;
  double _secondValue = 0.0;

  Timer _progressTimer;
  Timer _secondProgressTimer;

  bool _done = false;


  @override
  void initState() {
    // TODO: implement initState
    _resumeProgressTimer();

    _secondProgressTimer =
        Timer.periodic(const Duration(milliseconds: 10), (_) {
          setState(() {
            _secondValue += 0.001;
            if (_secondValue >= 1) {
              _secondProgressTimer.cancel();
            }
          });
        });

    super.initState();


  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        alignment: Alignment.center,
        color: Colors.black87,
        child: SeekBar(
          value: _value,
          secondValue: _secondValue,
          progressColor: Colors.blue,
          secondProgressColor: Colors.blue.withOpacity(0.5),
          onStartTrackingTouch: () {
            print('onStartTrackingTouch');
            if (!_done) {
              _progressTimer?.cancel();
            }
          },
          onProgressChanged: (value) {
            print('onProgressChanged:$value');
            _value = value;
          },
          onStopTrackingTouch: () {
            print('onStopTrackingTouch');
            if (!_done) {
              _resumeProgressTimer();
            }
          },
        ),
      ),
    );

  }

  void _resumeProgressTimer()
  {

    _progressTimer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        _value += 0.0005;
        if (_value >= 1) {
          _progressTimer.cancel();
          _done = true;
        }
      });
    });

  }

}