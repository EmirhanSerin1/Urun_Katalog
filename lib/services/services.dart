import 'dart:convert';

import 'package:http/http.dart' as http;

// I used two different body type

Future<http.Response> login(String email, String password) async {
  var body = jsonEncode({'email': email, 'password': password});
  String loginUrl = "https://assignment-api.piton.com.tr/api/v1/user/login";
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };
  http.Response response = await http.post(
    Uri.parse(loginUrl),
    headers: headers,
    body: body,
  );

  return response;
}

Future<http.Response> signup(String name, String email, String password) async {
  var body = json.encode({'email': email, 'password': password, 'name': name});
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };
  String signUp = "https://assignment-api.piton.com.tr/api/v1/user/register";
  final response = await http.post(
    Uri.parse(signUp),
    headers: headers,
    body: body,
  );

  return response;
}

Future<List> fetchProducts() async {
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
