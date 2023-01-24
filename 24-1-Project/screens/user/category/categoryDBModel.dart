//@dart=2.9
class CategoryModel {
  int id;
  String url;

  CategoryModel({this.id,this.url});

  factory CategoryModel.formMap(Map<String,dynamic> json) =>
      CategoryModel(id: json["id"],url: json["url"]);

  Map<String,dynamic> toMap() =>{
    "id":id,
    "url":url,
  };
}