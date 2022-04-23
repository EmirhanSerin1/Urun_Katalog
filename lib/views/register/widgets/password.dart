import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/reg_exps/reg_exps.dart';
import 'package:urun_katalog/core/constants/paddings/authentication_paddings.dart';
import 'package:urun_katalog/providers/controllers.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerPasswordController =
        Provider.of<Controllers>(context).registerPasswordController;

    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        controller: registerPasswordController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
            if (value!.isEmpty) {
              return "Password Cannot Be Empty";
            }
            if (!AllRegExps.password.hasMatch(value)) {
              return "Please Enter a Valid Password. Minimum 6 Character";
            }
            return null;
          },
        onSaved: (value) {
          registerPasswordController.text = value!;
        },
        
        textInputAction: TextInputAction.next,
        decoration:InputDecoration(
          prefixIcon: Icon(
            Icons.key_outlined,
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: AuthenticationPaddings.contentPadding,
          hintText: "Confirm Password ",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor),
            borderRadius: BorderRadius.circular(32),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
