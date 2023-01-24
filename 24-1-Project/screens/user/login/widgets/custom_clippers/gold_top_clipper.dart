//@dart=2.9
import 'package:flutter/material.dart';

class GoldTopClipper extends CustomClipper<Path> {
  const GoldTopClipper();

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 170.0)
    ..quadraticBezierTo(
      size.width / 2,
      280.0,
      size.width,
      255.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();

/*    ..lineTo(0.0, 270.0)
    ..quadraticBezierTo(
      size.width / 2,
      270.0,
      size.width,
      160.0,
    )
    ..lineTo(size.width, 0.0)
    ..close();*/

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}