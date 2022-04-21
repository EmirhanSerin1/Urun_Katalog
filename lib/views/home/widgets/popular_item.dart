import 'package:flutter/material.dart';
import 'package:urun_katalog/core/components/images/images.dart';
import 'package:urun_katalog/core/constants/paddings/home_paddings.dart';

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
      onTap: () {
        // print(datas[index]["name"]);
        // print(datas[index]["price"]);
        // print(datas[index]["description"]);
        // print(datas[index]["image"]);
        // print(datas[index]["id"]);
        // print(datas[index]["timeStamp"]);
      },
      child: Material(
        color: Colors.transparent,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(ProductImages.images[index],), fit: BoxFit.contain
            ),
          ),
        ),
      ),
    );
  }
}
