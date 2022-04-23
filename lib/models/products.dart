// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';


Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.products,
  });

  List<ProductElement> products;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductElement {
  ProductElement({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.timeStamp, 
    // required this.likes,
  });

  int? id;
  String? name;
  int? price;
  String? image;
  String? description;
  String? timeStamp;
  // late List<User> likes;

  ProductElement.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["email"];
    price = json["password"];
    image = json["name"];
    description = json["token"];
    timeStamp = json["timeStamp"];
    // likes =List<User>.from(json["likes"].map((x) => User.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['image'] = image;
    _data['description'] = description;
    _data['timeStamp'] = timeStamp;
    // _data['likes'] == null ? [] : likes.map((e) => e.toJson()).toList();
    return _data;
  }
}
