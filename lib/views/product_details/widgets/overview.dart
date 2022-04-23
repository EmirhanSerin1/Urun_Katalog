import 'package:flutter/material.dart';
import 'package:urun_katalog/core/constants/paddings/paddings_movie_details.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingMovieDetails.horizontalPadding +
          const EdgeInsets.only(bottom: 10, top: 10),
      child: Material(
        elevation: 2,
        child: ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OverView",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
