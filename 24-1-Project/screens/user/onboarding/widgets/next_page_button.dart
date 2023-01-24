//@dart=2.9
import 'package:flutter/material.dart';

import '../../../constants.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(kPaddingM),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: kLightGold,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: kBrown,
        size: 32.0,
      ),
    );
  }
}