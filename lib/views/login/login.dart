import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/providers/controllers.dart';
import 'package:urun_katalog/providers/keys.dart';
import 'package:urun_katalog/views/login/widgets/login_button.dart';
import 'package:urun_katalog/views/login/widgets/login_email_text_field.dart';
import 'package:urun_katalog/views/login/widgets/login_password_text_field.dart';
import 'package:urun_katalog/views/login/widgets/login_text.dart';
import 'package:urun_katalog/views/login/widgets/register_part.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginFormKey = Provider.of<FormKeys>(context).loginFormKey;
    final emailController = Provider.of<Controllers>(context).emailController;
    final passwwordController =
        Provider.of<Controllers>(context).passwordController;

    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        emailController.clear();
        passwwordController.clear();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Form(
            key: _loginFormKey,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const LoginText(),
                  Column(
                    children: const [
                      LoginEmailTextField(),
                      PasswordTextFeild(),
                      LoginButton(),
                    ],
                  ),
                  const RegisterPart(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

