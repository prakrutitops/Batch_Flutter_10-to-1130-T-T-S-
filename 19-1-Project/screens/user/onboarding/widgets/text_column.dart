//@dart=2.9
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String text;

  const TextColumn({
    this.title,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5.copyWith(color: kLightGold, fontWeight: FontWeight.bold,fontSize: 20),
        ),
        const SizedBox(height: kSpaceS),
        Text(text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: kLightGold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}