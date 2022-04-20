import 'package:flutter/material.dart';
import 'package:urun_katalog/views/login/login.dart';

void main() {
  runApp(const UrunKatolog());
}

class UrunKatolog extends StatelessWidget {
  const UrunKatolog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Urun Katalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
