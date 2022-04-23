import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:urun_katalog/core/constants/paddings/paddings_movie_details.dart';
import 'package:urun_katalog/views/product_details/widgets/rate.dart';
import 'package:http/http.dart' as http;


class NameAndLike extends StatelessWidget {
  const NameAndLike({
    Key? key,
    required this.datas,
    required this.index,
  }) : super(key: key);

  final List<dynamic>? datas;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingMovieDetails.horizontalPadding,
      child: Material(
        elevation: 2,
        child: ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //? Product
                Text(
                  datas![index]["name"],
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                //? Rate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                   const Rate(),
                    RepaintBoundary(
                      child: LikeButton(
                        likeCount: datas![index]["price"] ?? 0,
                        
                        bubblesColor:const BubblesColor(
                          dotPrimaryColor: Colors.transparent,
                          dotSecondaryColor: Colors.transparent,
                        ),
                        onTap: onLikeButtonTapped,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();
    

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

}
