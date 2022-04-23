
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:urun_katalog/core/components/images/images.dart';

class NewestPart extends StatelessWidget {
  const NewestPart({
    Key? key,
    required this.index,
    required this.snapshot,
  }) : super(key: key);

  final int? index;
  final AsyncSnapshot<List<dynamic>> snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: index,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 110,
              color: Colors.red.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                        imageUrl: ProductImages.images[index]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(snapshot.data![index]["name"]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            snapshot.data![index]["description"],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
