//@dart=2.9
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../model/student_model.dart';


Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}


Future loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Student student = new Student.fromJson(jsonResponse);
  print(student.studentScores);
}