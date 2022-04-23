import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:urun_katalog/core/components/images/images.dart';
import 'package:urun_katalog/core/components/page_route.dart';
import 'package:urun_katalog/views/product_details/product_details.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    Key? key,
    required this.datas,
    required this.index,
    required this.scale,
  }) : super(key: key);

  final List<dynamic> datas;
  final int index;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            createRoute(ProductDetails(datas: datas, index: index),
                x: 1, y: 1));
        // print(datas[index]["name"]);
        // print(datas[index]["price"]);
        // print(datas[index]["description"]);
        // print(datas[index]["image"]);
        // print(datas[index]);
      },
      child: Material(
        color: Colors.transparent,
        child: Hero(
          tag: datas[index]["name"].toString(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(ProductImages.images[index]),
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
