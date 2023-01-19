//@dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';


class Home extends StatefulWidget
{
  @override
    HomeState createState() => HomeState();

}

class HomeState extends State<Home>
{
  var size;


  Future<List> viewCategoryData() async{
    final responce = await http.get(Uri.parse("https://vyasprakruti.000webhostapp.com/FlutterProject/Category/category_view.php"));
    return jsonDecode(responce.body);
  }


  @override
  Widget build(BuildContext context)
  {

     size = MediaQuery.of(context).size;
     return Scaffold(
       backgroundColor: kLightGold,
       body: FutureBuilder<List>(
         future: viewCategoryData(),
         builder: (ctx,ss) {
           if(ss.hasData){
             return Items(list:ss.data,size: size);
           }
           else{
             return Center(
               child: CircularProgressIndicator(),
             );
           }
         },
       ),
     );
  }

}
class Items extends StatelessWidget {
  List list;
  var size;
  Items({this.list,this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(size.width*2.5/100, size.height*1.2/100, size.width*3/100, size.height*1.2/100),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Customized()));
            },
            child: Card(
              elevation: 3,
              shadowColor: kBrown,
              color: kGold,
              child: SizedBox(
                width: double.infinity,
                height: size.height*18.5/100,
                child: Column(
                  children: [
                    SizedBox(height: size.height*2/100),
                    Container(
                      child: Center(
                        child: Text("Customize Your Post".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: kTerracotta
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text("Create Now".toUpperCase(),
                        style: TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            color: kTerracotta
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*1.2/40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: size.width*3.8/27),
                        Container(
                          child: Icon(Icons.edit,color: kTerracotta,size: 40),
                          /*decoration: new BoxDecoration(
                            color: kBrown,
                          ),*/
                        ),
                        SizedBox(width: size.width*3.8/100),
                        Container(
                          child: Icon(Icons.camera_alt,color: kTerracotta,size: 40),
                          /*decoration: new BoxDecoration(
                            color: kBrown,
                          ),*/
                        ),
                        SizedBox(width: size.width*3.8/100),
                        Container(
                          child: Icon(Icons.brush,color: kTerracotta,size: 40),
                          /*decoration: new BoxDecoration(
                            color: kBrown,
                          ),*/
                        ),
                        SizedBox(width: size.width*3.8/100),
                        Container(
                          child: Icon(Icons.insert_emoticon,color: kTerracotta,size: 40),
                          /*decoration: new BoxDecoration(
                            color: kBrown,
                          ),*/
                        ),
                        SizedBox(width: size.width*3.8/100),
                        Container(
                          child: Icon(Icons.straighten,color: kTerracotta,size: 40),
                          /*decoration: new BoxDecoration(
                            color: kBrown,
                          ),*/
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: size.height*0.8/100),

          Expanded(
            child: GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 7,
              crossAxisCount: 2,
              children: List.generate(list.length, (index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Category(index: list[index]['id'],category_name: list[index]['category_name'])));
                  },
                  child: Card(
                    elevation: 3,
                    shadowColor: kBrown,
                    color: kTerracotta,
                    child: Column(
                      children: [
                        Container(
                          child:Image.network(list[index]['category_img'],
                            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                              return SizedBox(
                                height: size.height*16.3/95,
                                child: Center(
                                  child: Icon(Icons.error, size: 40, color: kLightGold,),
                                ),
                              );
                            },
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                height: size.height*16.3/95,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                ),
                              );
                            },
                            height: size.height*16.3/95,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, size.height*1.3/260, 0, 0),
                          child: Center(
                            child: Text("${list[index]['category_name']}".toUpperCase(),style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15, color: kLightGold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}