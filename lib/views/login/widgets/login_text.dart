import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Login",
      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white.withOpacity(0.6)),
    );
  }
}
