import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/page_route.dart';
import 'package:urun_katalog/core/constants/paddings/authentication_paddings.dart';
import 'package:urun_katalog/core/constants/texts/login_texts.dart';
import 'package:urun_katalog/providers/controllers.dart';
import 'package:urun_katalog/providers/keys.dart';
import 'package:urun_katalog/views/home/home_view.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = Provider.of<Controllers>(context).emailController;
    final passwordController =
        Provider.of<Controllers>(context).passwordController;
    final _loginFormKey = Provider.of<FormKeys>(context).loginFormKey;
    return InkWell(
      onTap: () {
        if (_loginFormKey.currentState!.validate()) {
          print(passwordController.text + emailController.text);
          Navigator.of(context).push(createRoute(const HomeView(), x: 1, y: 0));
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
            child: Text(LoginButtonTexts.login,
                style: Theme.of(context).textTheme.bodyText2)),
      ),
    );
  }
}
