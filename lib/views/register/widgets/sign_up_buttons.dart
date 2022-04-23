import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/snackbar/snackbar.dart';
import 'package:urun_katalog/services/services.dart';

import '../../../core/constants/paddings/authentication_paddings.dart';
import '../../../providers/controllers.dart';
import '../../../providers/keys.dart';
import '../../home/home_view.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController =
        Provider.of<Controllers>(context).registerEmailController;
    final _passwordController =
        Provider.of<Controllers>(context).registerPasswordController;
    final _firstName = Provider.of<Controllers>(context).firstNameController;
    final _registerFormKey = Provider.of<FormKeys>(context).registerFormKey;
    return InkWell(
      onTap: () async {
        if (_registerFormKey.currentState!.validate()) {
          http.Response req = await signup(
              _firstName.text, _emailController.text, _passwordController.text);
          if (req.statusCode == 200) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (contex) => const HomeView()));
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
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
        child: Center(
            child: Text("Sign Up",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w500))),
      ),
    );
  }
}
