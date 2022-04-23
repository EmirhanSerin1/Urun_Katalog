import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  const Rate({
    Key? key,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        rate(context),
        const Text("-  "),
        Text(
          "Result of 1.532  votes",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }

  Padding rate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(2)),
        child: Text(
          "7.2",
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
