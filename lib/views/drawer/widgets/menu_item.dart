import 'package:flutter/material.dart';
import 'package:urun_katalog/core/constants/paddings/paddings_drawer.dart';

class MenuItem extends StatelessWidget {
  //? Drawer Menu Item
  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final String text;
  final IconData icon;
  // final Widget widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        margin: PaddingMenuItem.margin,
        padding: PaddingMenuItem.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(color: Theme.of(context).primaryColor, width: 1),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.8),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white.withOpacity(0.8)),
            ),
          ],
        ),
      ),
    );
  }
}
// TextStyle(
//                 color: Theme.of(context).iconTheme.color,
//                 fontWeight: FontWeight.w500,
//               ),
