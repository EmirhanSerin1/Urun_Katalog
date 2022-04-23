import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/components/mask/phone_mask.dart';
import 'package:urun_katalog/core/components/reg_exps/reg_exps.dart';
import 'package:urun_katalog/providers/controllers.dart';
import 'package:urun_katalog/providers/keys.dart';
import 'package:urun_katalog/views/register/widgets/confirm_password.dart';
import 'package:urun_katalog/views/register/widgets/password.dart';
import 'package:urun_katalog/views/register/widgets/register_text.dart';
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

    final registerKey = Provider.of<FormKeys>(context).registerFormKey;

    return Material(
      color: Colors.transparent,
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: registerKey,
          child: SingleChildScrollView(
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              height: MediaQuery.of(context).size.height,
              constraints: BoxConstraints(
                // We are calculating height without appbar and status bar padding
                maxHeight: MediaQuery.of(context).size.height -
                    Theme.of(context).appBarTheme.toolbarHeight! -
                    MediaQuery.of(context).padding.top,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const RegisterText(),
                  const SizedBox(),
                  Column(
                    children: [
                      RepaintBoundary(
                        child: RegisterTextField(
                          hintText: "First Name",
                          isValidText:
                              "Please Enter a Valid Name. Minimum 2 Character",
                          isEmptyText: "First Name Cannot Be Empty",
                          controller: firstNameController,
                          regExp: AllRegExps.nameReg,
                          icon: Icons.person_outlined,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      RegisterTextField(
                        hintText: "Second Name",
                        isValidText:
                            "Please Enter a Valid Name. Minimum 2 Character",
                        isEmptyText: "Second Name Cannot Be Empty",
                        controller: secondNameController,
                        regExp: AllRegExps.nameReg,
                        icon: Icons.person_outlined,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      RegisterTextField(
                        hintText: "Email",
                        isValidText: "Please Enter a Valid Email",
                        isEmptyText: "Email Cannot Be Empty",
                        controller: registerEmailController,
                        regExp: AllRegExps.mailReg,
                        icon: Icons.mail_outline_outlined,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      RegisterTextField(
                        maskTextInputFormatter:
                            PhoneNumberFormatter.maskFormatter,
                        hintText: "Phone Number",
                        isValidText: "Please Enter a Phone Number.",
                        isEmptyText: "Phone Number Cannot Be Empty",
                        controller: phoneController,
                        regExp: AllRegExps.phoneNumber,
                        icon: Icons.call_outlined,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      const PasswordField(),
                      const ConfirmPasswordField(),
                    ],
                  ),
                  const SignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
