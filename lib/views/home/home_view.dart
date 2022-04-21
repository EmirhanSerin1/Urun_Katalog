import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/models/products.dart';
import 'package:urun_katalog/providers/token.dart';
import 'package:urun_katalog/view_model/product_view_model.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ListProductsViewModel listProductsViewModel = ListProductsViewModel();
  late Future<List> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchPro();
  }

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<Token>(context, listen: false).tokeis;
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  List<dynamic>? datas = snapshot.data;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        List<dynamic>? datas = snapshot.data;
                        print(datas![index]["image"]);
                      },
                      child: Container(
                        width: 110,
                        color: Colors.red,
                        // child: Image.network("${"https://assignment-api.piton.com.tr"+"/static/1.jpeg"}"),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
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
