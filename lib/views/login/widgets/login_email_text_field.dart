import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/constants/paddings/login_paddings.dart';
import 'package:urun_katalog/core/constants/texts/login_texts.dart';
import 'package:urun_katalog/providers/controllers.dart';

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = Provider.of<Controllers>(context).emailController;

    return Padding(
      padding: LoginPaddings.mainPadding,
      child: TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return EmailTexts.enterMail;
          }
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(emailController.text)) {
            return EmailTexts.validMail;
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.mail, color: Theme.of(context).secondaryHeaderColor),
          contentPadding: LoginPaddings.contentPadding,
          hintText: EmailTexts.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(32),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).secondaryHeaderColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
