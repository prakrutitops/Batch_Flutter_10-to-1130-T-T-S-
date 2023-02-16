class User {

  String product_name ="";
  String product_price ="";


  User(this.product_name, this.product_price);

  User.fromJson(Map<String, dynamic> json) {

    product_name = json['product_name'];
    product_price = json['product_price'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['product_name'] = this.product_name;
    data['product_price'] = this.product_price;

    return data;
  }
}