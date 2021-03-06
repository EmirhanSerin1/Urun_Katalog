import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/theme/appbar_theme/app_bar_theme.dart';
import 'package:urun_katalog/core/theme/dark/dark_theme.dart';
import 'package:urun_katalog/providers/controllers.dart';
import 'package:urun_katalog/providers/keys.dart';
import 'package:urun_katalog/providers/token.dart';
import 'package:urun_katalog/views/login/login.dart';

void main() {
  runApp(
    const UrunKatolog(),
  );
}

class UrunKatolog extends StatelessWidget {
  const UrunKatolog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Controllers()),
        Provider(create: (_) => FormKeys()),
        ChangeNotifierProvider(create: (context) => Token()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Urun Katalog',
        theme: ThemeData.dark().copyWith(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
          errorColor: DarkTheme.errorColor,
          scaffoldBackgroundColor: DarkTheme.scaffoldBackgroundColor,
          backgroundColor: DarkTheme.backgroundColor,
          primaryColor: DarkTheme.primaryColor,
          secondaryHeaderColor: DarkTheme.secondaryColor,
          //It will change
          bottomAppBarColor: DarkTheme.tealColor,
          textTheme: const TextTheme(
            headline4: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
            bodyText1:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            bodyText2: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white, fontSize: 11),
          ),
          appBarTheme:const AppBarTheme(
            toolbarHeight: 50,
            elevation: 2,
            color: DarkTheme.secondaryColor,
            iconTheme:  IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
        home: const Login(),
      ),
    );
  }
}
