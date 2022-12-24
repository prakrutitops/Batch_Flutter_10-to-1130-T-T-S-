//@dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';



class AdminUpload extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return AdminUploadPage();
  }
}

class AdminUploadPage extends State<AdminUpload> {
  var size;

  var upload_category = TextEditingController();

  PickedFile _imageFile;
  final String uploadUrl = 'https://amisha1299.000webhostapp.com/Ewishes/upload_category_main_image.php';
  final ImagePicker _picker = ImagePicker();


  //only image select
  void _pickImage() async
  {
    try {
      final pickedFile = await _picker.getImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e);
    }
    await uploadImage(_imageFile.path, uploadUrl+"?data="+upload_category.text.toString());
  }
//selected image upload
  Future<String> uploadImage(filepath, url) async
  {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('profile_pic', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }



  Future<String> categoryUploadImage(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('profile_pic', filepath));
    var res = await request.send();
    return res.reasonPhrase;
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kLightGold,
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(size.width*5/100 , size.height*33/100, size.width*5/100, 0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kBrown,
                    padding: const EdgeInsets.all(kPaddingM),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: kWhite,
                        title: Row(children: [Icon(Icons.add,color: kBrown,),Text("\tAdd Category", style: TextStyle(color: kBrown),)],),
                        content: Container(
                          height: size.height*14/100,
                          child: Column(
                            children: [
                              TextField(
                                controller: upload_category,
                                decoration: InputDecoration(
                                  hintText: "Input Category Name",
                                ),
                              ),
                              SizedBox(height: size.height*1/100),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: kBrown,
                                    padding: const EdgeInsets.all(kPaddingM),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if(!upload_category.text.isEmpty)
                                    {
                                      _pickImage();
                                    }
                                    else{
                                      Fluttertoast.showToast(msg: "Please Input Category Name",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
                                    }
                                  },
                                  child: Text("Select Image".toUpperCase(),
                                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: kLightGold,fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Cancel",style: TextStyle(color: kBrown)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if(upload_category.text.isNotEmpty && _imageFile!=null){
                                Fluttertoast.showToast(msg: "Category Added Successfully",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
                                Navigator.of(ctx).pop();
                              }
                              else{
                                if(upload_category.text.isEmpty){
                                  Fluttertoast.showToast(msg: "Please Input Category Name",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
                                }
                                else if(_imageFile==null){
                                  Fluttertoast.showToast(msg: "Please Select Category Image",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);
                                }
                              }
                            },
                            child: Text("Add",style: TextStyle(color: kBrown)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Upload Category".toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: kGold,fontStyle: FontStyle.italic, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height*2/100),

          ],
        ),
      ),
    );
  }
}


