//@dart=2.9
import 'package:flutter/material.dart';

import 'homepage.dart';

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
          title:"My page View Demo" ,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
  }

}