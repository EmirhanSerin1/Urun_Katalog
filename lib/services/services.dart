import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/products.dart';

class ProductService {
  Future<List<Product>> fetchProductsApi() async {
    String url = "https://assignment-api.piton.com.tr/api/v1/product/all";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "access-token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImV4YW1wbGVAZ21haWwuY29tIiwiaWF0IjoxNjUwNTUzNTIxLCJleHAiOjE2NzY0NzM1MjF9.yLjzCvbAlQdGdJOghQ18Tw_ztxLh_153lclKDfGRpjc"
      },
    );

    if (response.statusCode == 200) {
      final productList = json.decode(response.body)['products'];
      return productList;
    } else {
      throw Exception("Error fetching products");
    }
  }
}