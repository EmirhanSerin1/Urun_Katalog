import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/constants/paddings/paddings_movie_details.dart';
import 'package:urun_katalog/providers/token.dart';
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

  like(final List<dynamic>? datas, int index, String token, bool like) async {
    var id = datas![index]["id"];
    var body = jsonEncode({'productId': id});
    String likeUrl = "https://assignment-api.piton.com.tr/api/v1/product/like";
    String unLikeUrl =
        "https://assignment-api.piton.com.tr/api/v1/product/unlike";
    Map<String, String> headers = {
      "Accept": "application/json",
      "access-token": token,
      "Content-Type": "application/json"
    };

    http.Response response;

    //Checking like. If just liked sending like request, if not sending unLike request
    if (like == false) {
      response =
          await http.post(Uri.parse(likeUrl), headers: headers, body: body);
    } else {
      response =
          await http.post(Uri.parse(unLikeUrl), headers: headers, body: body);
    }

    //status code checking
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else if (response.statusCode == 401) {
      print(response.body);
      return false;
    } else if (response.statusCode == 404) {
      print(response.body);
      return false;
    }
  }
}
