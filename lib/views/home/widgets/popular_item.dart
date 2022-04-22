import 'package:flutter/material.dart';
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
    return Padding(
      padding: HomePaddings.horizontal + EdgeInsets.only(top: 50 - scale * 25, bottom:50 - scale * 25 ),
      child: InkWell(
        onTap: () {
          // print(datas[index]["name"]);
          // print(datas[index]["price"]);
          // print(datas[index]["description"]);
          // print(datas[index]["image"]);
          // print(datas[index]["id"]);
          // print(datas[index]["timeStamp"]);
        },
        child: Container(
          color: Colors.white.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 70,
                child: Container(
                  color: Colors.red.withOpacity(0.2),
                ),
              ),
              Expanded(
                flex: 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      datas[index]["name"].toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Author",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
