//@dart=2.9
import 'package:flutter/material.dart';

class LightGoldTopClipper extends CustomClipper<Path> {
  const LightGoldTopClipper();

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 150.0)
    ..quadraticBezierTo(
      size.width / 2,
      240.0,
      size.width,
      180.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  /* ..lineTo(0.0, 190.0)
    ..quadraticBezierTo(
      size.width / 2,
      230.0,
      size.width,
      140.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();
*/
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}