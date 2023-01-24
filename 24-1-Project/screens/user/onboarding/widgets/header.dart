//@dart=2.9
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          Ink.image(
            image: AssetImage('images/logo.png'),
            height: 50,
            width: 50,
          ),

        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: kLightGold,
                ),
          ),
        ),
      ],
    );
  }
}