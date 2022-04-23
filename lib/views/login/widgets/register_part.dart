import 'package:flutter/material.dart';
import 'package:urun_katalog/core/components/page_route.dart';
import 'package:urun_katalog/core/constants/paddings/authentication_paddings.dart';
import 'package:urun_katalog/core/constants/texts/login_texts.dart';
import 'package:urun_katalog/views/register/register.dart';

class RegisterPart extends StatelessWidget {
  const RegisterPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DHAAccountPartTexts.dHaveAA,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(createRoute(const Register(), x: 0, y: 1));
              },
              child: Text(
                DHAAccountPartTexts.signUp,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).bottomAppBarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
              ))
        ],
      ),
    );
  }
}
