import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:urun_katalog/views/drawer/drawer.dart';
import 'package:urun_katalog/views/home/widgets/head_line.dart';
import 'package:urun_katalog/views/home/widgets/newest_part.dart';
import 'package:urun_katalog/views/home/widgets/popular_part.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List> futureAlbum;
  PageController pageController = PageController();
  double viewportFraction = 0.6;
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
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(),
      body: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            ColoredBox(
              //  We are using material dark theme which means backgrounColor + / 20%primaryColor.
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              child: FutureBuilder<List>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  SizedBox(

                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child:  CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadLine(text: "Popular Books"),
                        //RepaintBoundary: If the widget re-paint itself, It will re-paint ->
                        //only the widget related to RepaintBoundary
                        RepaintBoundary(
                          child: PopularItemsPart(
                            pageController: pageController,
                            viewportFraction: viewportFraction,
                            pageOffSet: pageOffSet,
                            itemLength: snapshot.data!.length,
                            data: snapshot.data,
                          ),
                        ),
                        const HeadLine(text: "Newest"),
                        RepaintBoundary(
                          child: NewestPart(
                            itemCount: snapshot.data!.length,
                            snapshot: snapshot,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
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
