import 'package:flutter/material.dart';
import 'package:urun_katalog/core/constants/paddings/paddings_drawer.dart';
import 'package:urun_katalog/views/drawer/widgets/log_out_alert_dialog.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PaddingMenuItem.margin,
      padding: PaddingMenuItem.padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
      height: 50,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Log Out"),
            InkWell(
              onTap: () => showAlertdialog(context),
              child: Icon(
                Icons.power_settings_new,
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
