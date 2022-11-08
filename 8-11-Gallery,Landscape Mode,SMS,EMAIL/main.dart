//@dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'MailSMS.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(EmailSms());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:GalleryPage()
    );
  }

}
class GalleryPage extends StatefulWidget
{
  @override
  GalleryState createState() =>  GalleryState();

}

class GalleryState extends State<GalleryPage> {
  XFile galleryfile;

  final ImagePicker picker = new ImagePicker();

  imageSelectorGallery() async {


      galleryfile = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {});
      print("Path is $galleryfile");
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

            appBar: AppBar(title: Text("My Gallery App"),),
            body: Builder(builder:
            (BuildContext context)
                {

                  return Center(
                      child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                          ElevatedButton
                          (
                          onPressed: imageSelectorGallery,

                          child: new Text('Select Image from Gallery'),



                          ),
                        SizedBox(
                        height: 200.0,
                        width: 300.0,
                        child: galleryfile == null
                            ? Center(child: new Text('Sorry nothing selected!!'))
                            : Center(child: new Text('$galleryfile')),


                       ),


                          ],



                  ));
                }


            ),
    );
  }



}