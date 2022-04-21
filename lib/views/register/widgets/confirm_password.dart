import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/constants/paddings/authentication_paddings.dart';
import 'package:urun_katalog/providers/controllers.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerRePasswordController =
        Provider.of<Controllers>(context).registerRePasswordController;

    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        controller: registerRePasswordController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (registerRePasswordController.text != registerRePasswordController.text) {
            return "Confirm Password do not match";
          }else if(registerRePasswordController.text.isEmpty){
            return "Confirm Password can not be empty";
          }
          return null;
        },
        onSaved: (value) {
          registerRePasswordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration:InputDecoration(
          prefixIcon: Icon(
            Icons.key_outlined,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          contentPadding: AuthenticationPaddings.contentPadding,
          hintText: "Confirm Password ",
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
