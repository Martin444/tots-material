import 'dart:math';

import 'package:flutter/material.dart';

class BlobClipper extends CustomClipper<Path> {
  final Random random = Random();
  @override
  Path getClip(Size size) {
    var path = Path();
    var controlPoint1 =
        Offset(size.width * 0.35 + random.nextDouble() * 0.3, size.height * 0.05 + random.nextDouble() * 0.3);
    var controlPoint2 =
        Offset(size.width * 0.65 + random.nextDouble() * 0.3, size.height * 0.05 + random.nextDouble() * 0.3);
    var controlPoint3 =
        Offset(size.width * 0.85 + random.nextDouble() * 0.3, size.height * 0.35 + random.nextDouble() * 0.3);
    var controlPoint4 =
        Offset(size.width * 1.0 + random.nextDouble() * 0.2, size.height * 0.55 + random.nextDouble() * 0.3);
    var controlPoint5 =
        Offset(size.width * 0.75 + random.nextDouble() * 0.3, size.height * 0.85 + random.nextDouble() * 0.3);
    var controlPoint6 =
        Offset(size.width * 0.5 + random.nextDouble() * 0.3, size.height * 0.85 + random.nextDouble() * 0.3);
    var controlPoint7 =
        Offset(size.width * 0.25 + random.nextDouble() * 0.2, size.height * 0.75 + random.nextDouble() * 0.3);
    var controlPoint8 =
        Offset(size.width * 0.05 + random.nextDouble() * 0.2, size.height * 0.55 + random.nextDouble() * 0.3);
    path.moveTo(size.width * 0.15, size.height * 0.25);
    path.cubicTo(
        controlPoint1.dx, controlPoint1.dy, controlPoint2.dx, controlPoint2.dy, controlPoint3.dx, controlPoint3.dy);
    path.cubicTo(
        controlPoint4.dx, controlPoint4.dy, controlPoint5.dx, controlPoint5.dy, controlPoint6.dx, controlPoint6.dy);
    path.cubicTo(
        controlPoint7.dx, controlPoint7.dy, controlPoint8.dx, controlPoint8.dy, size.width * 0.15, size.height * 0.25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
