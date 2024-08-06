import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  double blockSizeHorizontal;
  MyCustomClipper({required this.blockSizeHorizontal});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(blockSizeHorizontal * 3.6, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - blockSizeHorizontal * 3.6, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
