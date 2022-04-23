import 'package:flutter/material.dart';
import 'package:urun_katalog/core/constants/texts/product_details_texts.dart';

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
          RateTexts.resultOf,
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
          RateTexts.rate,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
