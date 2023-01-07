//@dart=2.9
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectflutter/screens/user/splash_screen/SplashScreen.dart';
Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      title: 'E wishes',
      home: SplashScreen(),
    );
  }
}


