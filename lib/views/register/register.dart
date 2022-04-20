import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/mask/phone_mask.dart';
import 'package:urun_katalog/providers/controllers.dart';
import 'package:urun_katalog/views/register/widgets/confirm_password.dart';
import 'package:urun_katalog/views/register/widgets/sign_up_buttons.dart';
import 'package:urun_katalog/views/register/widgets/single_text_field.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController =
        Provider.of<Controllers>(context).firstNameController;
    final secondNameController =
        Provider.of<Controllers>(context).secondNameController;
    final registerEmailController =
        Provider.of<Controllers>(context).registerEmailController;
    final phoneController = Provider.of<Controllers>(context).phoneController;
    final registerPasswordController =
        Provider.of<Controllers>(context).registerPasswordController;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  RegisterTextField(
                    hintText: "First Name",
                    isValidText: "Please Enter a Valid Name. Minimum 2 Character",
                    isEmptyText: "First Name Cannot Be Empty",
                    controller: firstNameController,
                    regExp: RegExp(r'^.{2,}$'),
                    icon: Icons.person_outlined,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  RegisterTextField(
                    hintText: "Second Name",
                    isValidText: "Please Enter a Valid Name. Minimum 2 Character",
                    isEmptyText: "Second Name Cannot Be Empty",
                    controller: secondNameController,
                    regExp: RegExp(r'^.{2,}$'),
                    icon: Icons.person_outlined,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  RegisterTextField(
                    hintText: "Email",
                    isValidText: "Please Enter a Valid Email",
                    isEmptyText: "Email Cannot Be Empty",
                    controller: registerEmailController,
                    regExp: RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                    icon: Icons.person_outlined,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  RegisterTextField(
                    maskTextInputFormatter: PhoneNumberFormatter.maskFormatter,
                    hintText: "Phone Number",
                    isValidText: "Please Enter a Phone Number.",
                    isEmptyText: "Phone Number Cannot Be Empty",
                    controller: phoneController,
                    regExp: RegExp(r'^.{2,}$'),
                    icon: Icons.person_outlined,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  RegisterTextField(
                    hintText: "Password",
                    isValidText:
                        "Please Enter a Valid Password. Minimum 6 Character",
                    isEmptyText: "Password Cannot Be Empty",
                    controller: registerPasswordController,
                    regExp: RegExp(r'^[a-zA-Z0-9].{5,}$'),
                    icon: Icons.person_outlined,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  const ConfirmPasswordField(),
                ],
              ),
              const SignUpButton(),
              const SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
}
