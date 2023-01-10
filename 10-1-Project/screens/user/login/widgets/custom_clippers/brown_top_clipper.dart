//@dart=2.9
import 'package:flutter/material.dart';

class BrownTopClipper extends CustomClipper<Path> {
  const BrownTopClipper();

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 160.0)
    ..quadraticBezierTo(
      size.width / 2,
      260.0,
      size.width,
      220,
    )
    ..lineTo(size.width, 0.0)
    ..close();

   /* ..lineTo(0.0, 230.0)
    ..quadraticBezierTo(
      size.width / 2,
      250.0,
      size.width,
      150.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();*/

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}