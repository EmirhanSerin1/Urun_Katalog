import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/images/images.dart';
import 'package:urun_katalog/core/constants/box_properties/box_prop_movie_details.dart';
import 'package:urun_katalog/core/constants/paddings/paddings_movie_details.dart';
import 'package:urun_katalog/providers/token.dart';
import 'package:urun_katalog/views/product_details/widgets/overview.dart';
import 'package:urun_katalog/views/product_details/widgets/name_and_like.dart';


class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key? key,
    required this.datas,
    required this.index,
  }) : super(key: key);
  final List<dynamic> datas;
  final int index;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var _token = Provider.of<Token>(context, listen: false).tokeis;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                RepaintBoundary(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Hero(
                        tag: widget.datas[widget.index]["name"],
                        child: SizedBox(
                          height: 250,
                          child: AspectRatio(
                            aspectRatio: 77 / 100,
                            child: Image.network(
                                ProductImages.images[widget.index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                NameAndLike(
                  token: _token!,
                  datas: widget.datas,
                  index: widget.index,
                ),
                OverView(text: widget.datas[widget.index]["description"]),
                Padding(
                  padding: PaddingMovieDetails.allEight * 2,
                  child: Material(
                    elevation: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      color: Theme.of(context).secondaryHeaderColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.shopping_cart_outlined),
                              Text("Buy Now")
                            ],
                          ),
                          Text(widget.datas[widget.index]["price"].toString()),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
