//@dart=2.9
import 'dart:async';
import 'dart:io';

import 'package:amishaproject/screens/user/category/categoryDB.dart';
import 'package:amishaproject/screens/user/category/categoryDBModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants.dart';

class Download extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DownloadPage();
  }
}

class DownloadPage extends State<Download> {
  DB db;
  List<CategoryModel> data = [];
  bool fetchingData = true;

  void initState(){
    super.initState();
    db = DB();
  }

  Future getData() async {
    data = await db.getData();
    Timer(Duration(seconds: 1), ()=> setState(() {
      fetchingData = false;
    }));
  }

  void deleteCategory(int index){
    db.deleteData(data[index].id);
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<FileSystemEntity> _folders;
  /*  Future<void> getDir() async {
      final directory = await getApplicationDocumentsDirectory();
      final dir = directory.path;
      String pdfDirectory = '$dir/';
      final myDir = new Directory(pdfDirectory);
      setState(() {
        _folders = myDir.listSync(recursive: true, followLinks: false);
      });
      print(_folders);
    }*/


    return Scaffold(
      backgroundColor: kLightGold,
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          return data.length==0 ? fetchingData==true ? Center(child: CircularProgressIndicator()) : Center(child: Column(children: [SizedBox(height: size.height*40/100),Text("Downloaded Images Empty".toUpperCase(),style: TextStyle(color: kTerracotta,fontStyle: FontStyle.italic))])) :
          fetchingData==true ? Center(child: CircularProgressIndicator()) :
          GridView.count(
            padding: EdgeInsets.all(6),
            crossAxisSpacing: 10,
            mainAxisSpacing: 7,
            crossAxisCount: 2,
            children: List.generate(data.length, (index) {
              final url = data[index];
              return Column(





                children: [
                  Image.file(File(url.url),
                    fit: BoxFit.cover,
                    height: size.height*17.2/100,
                    width: double.infinity,
                    errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                      return SizedBox(
                        height: size.height*17.2/100,
                        child: Center(
                          child: Icon(Icons.error,size: 40, color: kGold,),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: size.height*5/100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kGold,
                    ),
                    child: ElevatedButton(
                      child: Text("Delete".toUpperCase(),style: TextStyle(color: kDarkBrown,fontStyle: FontStyle.italic)),
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: kWhite,
                            title: Row(children: [Icon(Icons.delete,color: kBrown,),Text("\tDelete",style: TextStyle(color: kBrown),)],),
                            content: Text("This image will be permanently deleted.",style: TextStyle(fontStyle: FontStyle.italic,color: kTerracotta)),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Cancel",style: TextStyle(color: kBrown)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  deleteCategory(index);
                                  Navigator.of(context).pop();
                                },
                                child: Text("Delete",style: TextStyle(color: kBrown)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}