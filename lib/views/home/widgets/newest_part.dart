import 'package:flutter/material.dart';
import 'package:urun_katalog/views/home/widgets/newest_single_item.dart';

class NewestPart extends StatelessWidget {
  const NewestPart({
    Key? key,
    required this.snapshot,
    required this.itemCount,
  }) : super(key: key);

  final int? itemCount;
  final AsyncSnapshot<List<dynamic>> snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SingleNewestItem(
            snapshot: snapshot,
            index: index,
          );
        },
      ),
    );
  }
}
