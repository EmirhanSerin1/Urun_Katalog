import 'package:urun_katalog/models/user.dart';

class Product {
  Product(
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.timeStamp,
    this.likes,
  );

  int id;
  String name;
  int price;
  String image;
  String description;
  DateTime timeStamp;
  List<User> likes;
}
