import 'package:flutter/material.dart';
import 'package:urun_katalog/views/login/login.dart';

class LogOutAlertDialog extends StatelessWidget {
  const LogOutAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showAlertdialog(context);
  }
}

showAlertdialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      title: const Text('Logout'),
      content: const Text('Are you sure you want to sign out of your account?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text('Cancel', style: Theme.of(context).textTheme.bodyText2),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const Login())), //logout(context),
          child: Text('OK', style: Theme.of(context).textTheme.bodyText2),
        ),
      ],
    ),
  );
}
