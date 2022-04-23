import 'package:flutter/material.dart';
import 'package:urun_katalog/core/constants/paddings/home_paddings.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomePaddings.horizontal + HomePaddings.mainItemsVertical,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
