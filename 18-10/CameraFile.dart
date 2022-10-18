//@dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
class CameraFile extends StatelessWidget
{
  File cameraFile;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(

        title: Text("Phone Call"),
      ),

      body: Padding
        (

        padding: EdgeInsets.all(25),
        child: ElevatedButton(onPressed:()
        {
          _selectFromCamera();

        }, child: Text("Open Camera"), ),),
    );
  }

  _selectFromCamera() async {
    cameraFile=(await ImagePicker().pickImage(
      source: ImageSource.camera,

    )) as File;

  }
  }

