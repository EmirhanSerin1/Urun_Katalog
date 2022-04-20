import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/constants/paddings/login_paddings.dart';
import 'package:urun_katalog/core/constants/texts/login_texts.dart';
import 'package:urun_katalog/providers/controllers.dart';

class PasswordTextFeild extends StatelessWidget {
  const PasswordTextFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController =
        Provider.of<Controllers>(context).passwordController;

    return Padding(
      padding: LoginPaddings.mainPadding,
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        controller: passwordController,
        validator: (value) {
          RegExp regExp = RegExp(r'^[a-zA-Z0-9].{5,}$');
          if (value!.isEmpty) {
            return PasswordTexts.enterPassword;
          }
          if (!regExp.hasMatch(value)) {
            return PasswordTexts.validPassword;
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        maxLength: 20,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          counterText: "",
          prefixIcon: Icon(Icons.vpn_key,
              color: Theme.of(context).secondaryHeaderColor),
          contentPadding: LoginPaddings.contentPadding,
          hintText: PasswordTexts.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
