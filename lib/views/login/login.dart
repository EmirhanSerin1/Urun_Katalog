import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/providers/controllers.dart';
import 'package:urun_katalog/providers/keys.dart';
import 'package:urun_katalog/views/login/widgets/login_button.dart';
import 'package:urun_katalog/views/login/widgets/login_email_text_field.dart';
import 'package:urun_katalog/views/login/widgets/login_password_text_field.dart';
import 'package:urun_katalog/views/login/widgets/login_text.dart';
import 'package:urun_katalog/views/login/widgets/register_part.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final _loginFormKey = Provider.of<FormKeys>(context).loginFormKey;
    final _emailController = Provider.of<Controllers>(context).emailController;
    final _passwwordController =
        Provider.of<Controllers>(context).passwordController;

  

    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        _emailController.clear();
        _passwwordController.clear();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ColoredBox(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          child: SafeArea(
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const LoginText(),
                  Column(
                    children: [
                      LoginEmailTextField(),
                      PasswordTextField(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CheckboxListTile(
                          title: Text("Remember me"),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                            print(isChecked);
                          },
                        ),
                      ),
                      const LoginButton(),
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
