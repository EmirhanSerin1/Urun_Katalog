import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urun_katalog/core/constants/mask/phone_mask.dart';
import 'package:urun_katalog/core/constants/reg_exps/reg_exps.dart';
import 'package:urun_katalog/core/constants/texts/register_texts.dart';
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
    final _firstNameController =
        Provider.of<Controllers>(context).firstNameController;
    final _secondNameController =
        Provider.of<Controllers>(context).secondNameController;
    final _registerEmailController =
        Provider.of<Controllers>(context).registerEmailController;
    final _phoneController = Provider.of<Controllers>(context).phoneController;
    final _registerKey = Provider.of<FormKeys>(context).registerFormKey;

    return Material(
      color: Colors.transparent,
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _registerKey,
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
                          hintText: FirstNameTexts.hintText,
                          isValidText: FirstNameTexts.isValidText,
                          isEmptyText: FirstNameTexts.isValidText,
                          controller: _firstNameController,
                          regExp: AllRegExps.nameReg,
                          icon: Icons.person_outlined,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      RegisterTextField(
                        hintText: SecondNameTexts.hintText,
                        isValidText: SecondNameTexts.isValidText,
                        isEmptyText: SecondNameTexts.emptyText,
                        controller: _secondNameController,
                        regExp: AllRegExps.nameReg,
                        icon: Icons.person_outlined,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      RegisterTextField(
                        hintText: EmailTexts.hintText,
                        isValidText: EmailTexts.isValidText,
                        isEmptyText: EmailTexts.emptyText,
                        controller: _registerEmailController,
                        regExp: AllRegExps.mailReg,
                        icon: Icons.mail_outline_outlined,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      RegisterTextField(
                        maskTextInputFormatter:
                            PhoneNumberFormatter.maskFormatter,
                        hintText: PhoneNumberTexts.hintText,
                        isValidText: PhoneNumberTexts.isValidText,
                        isEmptyText: PhoneNumberTexts.emptyText,
                        controller: _phoneController,
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
