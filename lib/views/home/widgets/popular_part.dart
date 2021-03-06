
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:urun_katalog/views/home/widgets/popular_item.dart';

class PopularItemsPart extends StatelessWidget {
  const PopularItemsPart({
    Key? key,
    required this.pageController,
    required this.viewportFraction,
    required this.pageOffSet,
    required this.itemLength,
    required this.data,
  }) : super(key: key);

  final PageController pageController;
  final double viewportFraction;
  final double pageOffSet;
  final int itemLength;
  final List<dynamic>? data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.3,
      child: PageView.builder(
        itemCount: itemLength,
        controller: pageController,
        itemBuilder: (context, index) {
          double scale = max(viewportFraction,
              (1 - (pageOffSet - index).abs()) + viewportFraction);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(
                  top: 100 - scale * 25, bottom: 100 - scale * 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: PopularItem(
                scale: scale,
                datas: data!,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}
