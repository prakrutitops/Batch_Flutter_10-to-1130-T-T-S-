//@dart=2.9
import 'package:flutter/material.dart';
import '../cards_stack.dart';

class OnboardingPage extends StatelessWidget {
  final int number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Widget textColumn;

  const OnboardingPage({
    this.number,
    this.lightCardChild,
    this.darkCardChild,
    this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          pageNumber: number,
          lightCardChild: lightCardChild,
          darkCardChild: darkCardChild,
        ),
        SizedBox(height: number % 2 == 1 ? 50.0 : 25.0),
        textColumn,
      ],
    );
  }
}