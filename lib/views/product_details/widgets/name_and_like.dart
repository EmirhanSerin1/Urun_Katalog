import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:urun_katalog/core/constants/paddings/paddings_movie_details.dart';
import 'package:urun_katalog/services/services.dart';
import 'package:urun_katalog/views/product_details/widgets/rate.dart';
import 'package:http/http.dart' as http;

class NameAndLike extends StatefulWidget {
  const NameAndLike({
    Key? key,
    required this.datas,
    required this.index,
    required this.token,
  }) : super(key: key);

  final List<dynamic>? datas;
  final int index;
  final String token;

  @override
  State<NameAndLike> createState() => _NameAndLikeState();
}

class _NameAndLikeState extends State<NameAndLike> {
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
                  widget.datas![widget.index]["name"],
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                //? Rate
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Rate(),
                    LikeButton(
                      likeCount: widget.datas![widget.index]["likes"] ?? 0,
                      onTap: onLikeButtonTapped,
                      circleColor: const CircleColor(
                        start: Color(0xff00ddff),
                        end: Color(0xff0099cc),
                      ),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Color(0xff33b5e5),
                        dotSecondaryColor: Color(0xff0099cc),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    //Sending request
    final bool success = await like(widget.datas, widget.index, widget.token, isLiked);
    if (success == true) {
      return !isLiked;
    } else {
      return isLiked;
    }
  }

}
