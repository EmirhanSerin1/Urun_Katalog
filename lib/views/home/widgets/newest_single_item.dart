import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:urun_katalog/core/components/images/images.dart';
import 'package:urun_katalog/core/constants/texts/home_texts.dart';

class SingleNewestItem extends StatelessWidget {
  const SingleNewestItem({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  final AsyncSnapshot<List> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        child: Container(
          width: double.infinity,
          height: 110,
          color: Theme.of(context).secondaryHeaderColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  image(),
                  informations(context),
                ],
              ),
              addShoppingCart()
            ],
          ),
        ),
      ),
    );
  }

  Padding informations(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Using Sized Box for limited text
                      name(context),
                      //Using Sized Box for limited text
                      description(context),
                      price(context),
                    ],
                  ),
                );
  }

  Padding image() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: CachedNetworkImage(imageUrl: ProductImages.images[index]),
    );
  }

  SizedBox name(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NewestTexts.name,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            snapshot.data![index]["name"],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white.withOpacity(0.75)),
          ),
        ],
      ),
    );
  }

  SizedBox description(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NewestTexts.description,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            snapshot.data![index]["description"],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white.withOpacity(0.75)),
          ),
        ],
      ),
    );
  }

  SizedBox price(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            NewestTexts.price,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            snapshot.data![index]["price"].toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white.withOpacity(0.75)),
          ),
        ],
      ),
    );
  }

  Padding addShoppingCart() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: const Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }
}
