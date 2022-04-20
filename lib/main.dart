import 'package:flutter/material.dart';
import 'package:urun_katalog/core/constants/colors/theme_colors.dart';
import 'package:urun_katalog/core/theme/appbar_theme/app_bar_theme.dart';
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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ThemeColors.scaffoldBackgroundColor ,
         appBarTheme:const AppBarTheme(
           elevation: CustomAppBarTheme.elevation,
           color: CustomAppBarTheme.backgroundColor,
         )
      ),
      home: Login(),
    );
  }
}
