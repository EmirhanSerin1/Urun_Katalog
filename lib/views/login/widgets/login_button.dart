import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/snackbar/snackbar.dart';
import 'package:urun_katalog/core/constants/paddings/authentication_paddings.dart';
import 'package:urun_katalog/core/constants/texts/login_texts.dart';
import 'package:urun_katalog/providers/controllers.dart';
import 'package:urun_katalog/providers/keys.dart';
import 'package:urun_katalog/providers/token.dart';
import 'package:urun_katalog/services/services.dart';
import 'package:urun_katalog/views/home/home_view.dart';
import 'package:http/http.dart' as http;

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = Provider.of<Controllers>(context).emailController;
    final passwordController =
        Provider.of<Controllers>(context).passwordController;
    final _loginFormKey = Provider.of<FormKeys>(context).loginFormKey;
    return InkWell(
      onTap: () async {
        
        if (_loginFormKey.currentState!.validate()) {
          http.Response req = await login(
              emailController.text.trim(), passwordController.text.trim());

          Map bodyMap = jsonDecode(req.body);
          Provider.of<Token>(context, listen: false)
              .tokis(bodyMap["token"].toString());

          if (req.statusCode == 200 && bodyMap["token"] != "") {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeView()));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.snackBar);
          }
        }
      },
      child: Container(
        padding: AuthenticationPaddings.contentPadding,
        margin: AuthenticationPaddings.mainPadding,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            LoginButtonTexts.login,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

}
