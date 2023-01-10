//@dart=2.9
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class WorkDarkCardContent extends StatelessWidget {
  const WorkDarkCardContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.person_pin,
              color: kLightGold,
              size: 32.0,
            ),
          ],
        ),
        const SizedBox(height: kSpaceM),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.person,
              color: kLightGold,
              size: 32.0,
            ),
            Icon(
              Icons.group,
              color: kLightGold,
              size: 32.0,
            ),
            Icon(
              Icons.insert_emoticon,
              color: kLightGold,
              size: 32.0,
            ),
          ],
        ),
      ],
    );
  }
}