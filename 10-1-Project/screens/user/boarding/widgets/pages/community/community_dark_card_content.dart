//@dart=2.9
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class CommunityDarkCardContent extends StatelessWidget {
  const CommunityDarkCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.brush,
            color: kLightGold,
            size: 32.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: kPaddingL),
          child: Icon(
            Icons.camera_alt,
            color: kLightGold,
            size: 32.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: kPaddingL),
          child: Icon(
            Icons.straighten,
            color: kLightGold,
            size: 32.0,
          ),
        ),
      ],
    );
  }
}