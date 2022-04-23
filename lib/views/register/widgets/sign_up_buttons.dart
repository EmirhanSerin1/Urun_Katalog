import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/snackbar/snackbar.dart';

import '../../../core/constants/paddings/authentication_paddings.dart';
import '../../../providers/controllers.dart';
import '../../../providers/keys.dart';
import '../../home/home_view.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    final emailController =
        Provider.of<Controllers>(context).registerEmailController;
    final passwordController =
        Provider.of<Controllers>(context).registerPasswordController;
    final firstName = Provider.of<Controllers>(context).firstNameController;
    final _registerFormKey = Provider.of<FormKeys>(context).registerFormKey;
    return InkWell(
      onTap: () async {
        if (_registerFormKey.currentState!.validate()) {
          http.Response req = await signup(firstName.text, emailController.text,
              passwordController.text, context);
          if (req.statusCode == 200) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contex) => const HomeView()));
          }else{
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
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
        child: Center(
            child:
                Text("Sign Up", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w500))),
      ),
    );
  }

  Future<http.Response> signup(
      String name, String email, String password, BuildContext context) async {
    Map data = {'email': email, 'password': password, 'name': name};
    String signUp = "https://assignment-api.piton.com.tr/api/v1/user/register";
    final response = await http
        .post(
          Uri.parse(signUp),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: data,
          encoding: Encoding.getByName("utf-8"),
        )
        .then((value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeView())));

    
    return response;
  }
}
