import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/constants/paddings/authentication_paddings.dart';
import 'package:urun_katalog/providers/controllers.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController =
        Provider.of<Controllers>(context).firstNameController;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: AuthenticationPaddings.mainPadding,
              child: TextFormField(
                autofocus: false,
                controller: firstNameController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  RegExp regExp = RegExp(r'^.{2,}$');
                  if (value!.isEmpty) {
                    return "First Name Cannot Be Empty";
                  }
                  if (!regExp.hasMatch(value)) {
                    return "Please Enter a Valid Name. Minimum 2 Character";
                  }
                  return null;
                },
                onSaved: (value) {
                  firstNameController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outlined,
                        color: Theme.of(context).primaryColor),
                    contentPadding: AuthenticationPaddings.contentPadding,
                    hintText: "First Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
