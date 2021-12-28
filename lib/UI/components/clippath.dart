import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomdClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 8.h);
    path.quadraticBezierTo(width / 2, height, width, height - 8.h);

    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
