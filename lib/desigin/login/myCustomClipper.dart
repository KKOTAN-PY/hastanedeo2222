import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.height,0 );
    path.quadraticBezierTo(
        size.width -700, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) => false;

}