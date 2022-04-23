import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:urun_katalog/core/constants/texts/home_texts.dart';
import 'package:urun_katalog/services/services.dart';
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
  late Future<List> futureList;
  PageController pageController = PageController();
  double viewportFraction = 0.6;
  double pageOffSet = 0;

  @override
  void initState() {
    super.initState();
    futureList = fetchProducts();
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
                future: futureList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadLine(text: HomeTexts.popular),
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
                        const HeadLine(text: HomeTexts.newest),
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
}
