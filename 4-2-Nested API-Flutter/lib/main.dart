//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mytest/services/post_services.dart';

import 'model/post_model.dart';

void main() {
  runApp(new MyApp());
//  loadProduct();
//  loadPhotos();
//  loadAddress();
//  loadStudent();
//  loadShape();
//  loadBakery();
//  loadPage();
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Home()
    );
  }
}

class Home extends StatelessWidget{

  callAPI(){
    Post post = Post(
      body: 'Testing body body body',
      title: 'Flutter jam6'
    );
    createPost(post).then((response){
        if(response.statusCode > 200)
        print(response.body);
        else
          print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body : FutureBuilder<Post>(
            future: getPost(),
            builder: (context, snapshot) {
              callAPI();
              if(snapshot.connectionState == ConnectionState.done) {

                if(snapshot.hasError){
                  return Text("Error");
                }

                return Text('Title from Post JSON : ${snapshot.data.title}');

              }
              else
                return CircularProgressIndicator();
            }
        )
    );
  }

}