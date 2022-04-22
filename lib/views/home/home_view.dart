import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/constants/paddings/home_paddings.dart';
import 'package:urun_katalog/models/products.dart';
import 'package:urun_katalog/providers/token.dart';
import 'package:urun_katalog/view_model/product_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:urun_katalog/views/home/widgets/head_line.dart';
import 'package:urun_katalog/views/home/widgets/popular_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ListProductsViewModel listProductsViewModel = ListProductsViewModel();
  late Future<List> futureAlbum;
  PageController pageController = PageController();
  double viewportFraction = 0.7;
  double pageOffSet = 0;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchPro();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffSet = pageController.page!;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<Token>(context, listen: false).tokeis;
    var selectedIndex = 0;
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder<List>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadLine(text: "Popular Books"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.3,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          List<dynamic>? data = snapshot.data;

                          double scale = max(
                              viewportFraction,
                              (1 - (pageOffSet - index).abs()) +
                                  viewportFraction);
                          return PopularItem(
                            scale: scale,
                            datas: data!,
                            index: index,
                          );
                        },
                      ),
                    ),
                    const HeadLine(text: "Newest"),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List> fetchPro() async {
    //Data call
    final response = await http.get(
      Uri.parse('https://assignment-api.piton.com.tr/api/v1/product/all'),

      // I have to change token. I have to use shared preferences.
      headers: {
        "access-token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImV4YW1wbGVAZ21haWwuY29tIiwiaWF0IjoxNjUwNTUzNTIxLCJleHAiOjE2NzY0NzM1MjF9.yLjzCvbAlQdGdJOghQ18Tw_ztxLh_153lclKDfGRpjc"
      },
    );

    //We are taking datas
    List data = json.decode(response.body)['products'];

    // In this example we can take a specific data
    // dynamic lale = data[0]["name"];
    // print(lale);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // We are turning Data List
      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}

